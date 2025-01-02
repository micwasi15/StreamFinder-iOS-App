import SwiftUI
import SwiftData

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: User?
    var isUserLoggedIn: Bool {
        userId != nil
    }
    @Published var userId: Int64?
    @Published var favoritesUpdated = false
    @Published var isGuest: Bool = false

    private let userStorage = UserStorage()
    @Environment(\.modelContext) private var modelContext

    init() {
        Task {
            await loadUser()
        }
    }

    func loadUser() async {
        do {
            self.user = try userStorage.loadUser()
        } catch {
            print("Failed to load user: \(error)")
        }
    }

    func saveUser(_ user: User) async {
        do {
            try userStorage.saveUser(user)
            self.user = user
        } catch {
            print("Failed to save user: \(error)")
        }
    }

    func deleteUser() async {
        self.user = nil
        userStorage.deleteUser()
    }

    func login(email: String, password: String) async {
        do {
            userId = try await APIUserHandler.getUserId(email: email, password: password)
            user = User(email: email, password: password)
            await saveUser(user!)
        } catch {
            userId = nil
            print("Failed to login: \(error)")
        }
    }

    func logout() {
        self.userId = nil
        self.user = nil
        Task {
            await deleteUser()
        }
    }

    func register(email: String, password: String) async {
        do {
            self.userId = try await APIUserHandler.createUser(email: email, password: password)
            self.user = User(email: email, password: password)
            await saveUser(user!)
        } catch {
            self.userId = nil
            print("Failed to create user: \(error)")
        }
    }

    private func fetchLocalFavoriteShowIds() throws -> Set<Int> {
        let savedShows = try modelContext.fetch(FetchDescriptor<Show>())
        return Set(savedShows.map { $0.apiId })
    }

    func getUserFavorites() async -> [Show] {
        guard let userId = userId else { return [] }

        if favoritesUpdated {
            do {
                return try modelContext.fetch(FetchDescriptor<Show>())
            } catch {
                
            }
        }

        do {
            let favoritesIds = try await APIUserHandler.getUserFavoritesIds(userId: userId)
            let localFavoriteIds = try fetchLocalFavoriteShowIds()
            let newFavorites = favoritesIds.filter { !localFavoriteIds.contains($0) }
            let removedFavorites = localFavoriteIds.filter { !favoritesIds.contains($0) }

            for showId in newFavorites {
                let show = try await APIShowHandler.getShow(id: Int(showId))
                modelContext.insert(show)
                do {
                    try modelContext.save()
                } catch {}
            }

            for showId in removedFavorites {
                if let show = try? modelContext.fetch(
                    FetchDescriptor<Show>(
                        predicate: #Predicate { $0.apiId == showId }
                    )
                ).first {
                    modelContext.delete(show)
                    do {
                        try modelContext.save()
                    } catch {}
                }
            }

            favoritesUpdated = true
            return try modelContext.fetch(FetchDescriptor<Show>())
        } catch {
            print("Failed to get user favorites: \(error)")
            return []
        }
    }

    func addUserFavorite(showId: Int) async {
        guard let userId = userId else { return }

        do {
            try await APIUserHandler.addUserFavorite(userId: userId, showId: showId)
            let show = try await APIShowHandler.getShow(id: showId)
            do {
                modelContext.insert(show)
                try modelContext.save()
            } catch {}
        } catch {
            print("Failed to add user favorite: \(error)")
        }
    }

    func removeUserFavorite(showId: Int) async {
        guard let userId = userId else { return }

        do {
            try await APIUserHandler.removeUserFavorite(userId: userId, showId: showId)
            if let show = try? modelContext.fetch(
                FetchDescriptor<Show>(
                    predicate: #Predicate { $0.apiId == showId }
                )
            ).first {
                modelContext.delete(show)
                do {
                    modelContext.insert(show)
                    try modelContext.save()
                } catch {}
            }
        } catch {
            print("Failed to remove user favorite: \(error)")
        }
    }
    
    func setIsGuest(val: Bool) {
        isGuest = val
    }
}

@MainActor
class UserViewModelPreview: UserViewModel {
    override init() {
        super.init()
        user = nil
        userId = nil
    }

    override func login(email: String, password: String) async {
        userId = 1
        user = User(email: email, password: password)
    }

    override func logout() {
        userId = nil
        user = nil
    }

    override func register(email: String, password: String) async {
        userId = 1
        user = User(email: email, password: password)
    }

    override func getUserFavorites() async -> [Show] {
        return []
    }

    override func addUserFavorite(showId: Int) async {
        return
    }

    override func removeUserFavorite(showId: Int) async {
        return
    }

    override func setIsGuest(val: Bool) {
        isGuest = val
    }
}   
