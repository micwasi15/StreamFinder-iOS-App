import SwiftUI

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var isUserLoggedIn: Bool {
        userId != nil
    }
    @Published var userId: Int64?
    @Published var favoritesUpdated = false
    @Published var isGuest: Bool = false

    private let userStorage = UserStorage()
    @Environment(.\modelContext) private var modelContext

    init() {
        Task {
            loadUser()
        }
    }

    func loadUser() async {
        do {
            user = try await userStorage.loadUser()
        } catch {
            print("Failed to load user: \(error)")
        }
    }

    func saveUser(_ user: User) async {
        do {
            try await userStorage.saveUser(user)
            self.user = user
        } catch {
            print("Failed to save user: \(error)")
        }
    }

    func deleteUser() async {
        user = nil
        await userStorage.deleteUser()
    }

    func login(email: String, password: String) async {
        do {
            userId = try await APIUserHandler.getUserId(email: email, password: password)
            user = User(email: email, password: password)
            await saveUser(user)
        } catch {
            userId = nil
            print("Failed to login: \(error)")
        }
    }

    func logout() {
        userId = nil
        user = nil
        Task {
            await deleteUser()
        }
    }

    func register(email: String, password: String) async {
        do {
            userId = try await APIUserHandler.createUser(email: email, password: password)
            user = User(email: email, password: password)
            await saveUser(user)
        } catch {
            userId = nil
            print("Failed to create user: \(error)")
        }
    }

    private func fetchLocalFavoriteShowIds(from modelContext: ModelContext) throws -> Set<Int64> {
        let savedShows = try modelContext.fetch(FetchDescriptor<Show>())
        return Set(savedShows.map { $0.apiId })
    }

    func getUserFavorites() async -> [Show] {
        guard let userId = userId else { return }

        if favoritesUpdated {
            return try await modelContext.fetch(FetchDescriptor<Show>())
        }

        do {
            let favoritesIds = try await APIUserHandler.getUserFavoritesIds(userId: userId)
            let localFavoriteIds = try fetchLocalFavoriteShowIds(from: modelContext)
            let newFavorites = favoritesIds.filter { !localFavoriteIds.contains($0) }
            let removedFavorites = localFavoriteIds.filter { !favoritesIds.contains($0) }

            for showId in newFavorites {
                let show = try await APIShowHandler.getShow(id: Int(showId))
                try modelContext.save(show)
            }

            for showId in removedFavorites {
                let show = try modelContext.fetch(FetchDescriptor<Show>().filtered(by: \.$apiId == showId)).first
                if let show = show {
                    try modelContext.delete(show)
                }
            }

            favoritesUpdated = true
            return try await modelContext.fetch(FetchDescriptor<Show>())
        } catch {
            print("Failed to get user favorites: \(error)")
        }
    }

    func addUserFavorite(showId: Int) async {
        guard let userId = userId else { return }

        do {
            try await APIUserHandler.addUserFavorite(userId: userId, showId: showId)
            let show = try await APIShowHandler.getShow(id: showId)
            try modelContext.save(show)
        } catch {
            print("Failed to add user favorite: \(error)")
        }
    }

    func removeUserFavorite(showId: Int) async {
        guard let userId = userId else { return }

        do {
            try await APIUserHandler.removeUserFavorite(userId: userId, showId: showId)
            if let show = try modelContext.fetch(FetchDescriptor<Show>().filtered(by: \.$apiId == showId)).first {
                try modelContext.delete(show)
            }
        } catch {
            print("Failed to remove user favorite: \(error)")
        }
    }
}