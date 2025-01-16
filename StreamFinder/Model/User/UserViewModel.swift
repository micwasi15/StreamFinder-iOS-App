import SwiftUI

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: User?
    var isUserLoggedIn: Bool {
        userId != nil
    }
    @Published var userId: Int64?
    @Published var favoritesUpdated = false
    @Published var isGuest: Bool = true
    @Published var favoriteShows: [Show] = []
    
    private let userStorage = UserStorage()
    
    init(_ loggedIn: Bool = true) {
        if loggedIn {
            Task {
                await loadUser()
                await loadFavorites()
            }
        } else {
            isGuest = false
        }
    }
    
    func loadUser() async {
        do {
            self.user = try userStorage.loadUser()
            if let user = self.user {
                await login(email: user.email, password: user.password)
            } else {
                throw UserError.noUser
            }
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

    func login(email: String, password: String) async -> Bool {
        do {
            userId = try await APIUserHandler.getUserId(email: email, password: password)
            user = User(email: email, password: password)
            await loadFavorites()
            await saveUser(user!)
            return true
        } catch {
            userId = nil
            print("Failed to login: \(error)")
            return false
        }
    }

    func logout() {
        self.userId = nil
        self.user = nil
        self.favoritesUpdated = false
        Task {
            await deleteUser()
        }
    }

    func register(email: String, password: String) async -> Bool {
        do {
            self.userId = try await APIUserHandler.createUser(email: email, password: password)
            self.user = User(email: email, password: password)
            await saveUser(user!)
            return true
        } catch {
            self.userId = nil
            print("Failed to create user: \(error)")
            return false
        }
    }
    
    func saveFavorites() {
        FavoritesStorage.saveFavorites(favoriteShows)
    }
    
    func loadFavorites() async {
        if favoritesUpdated {
            return
        }
        
        favoriteShows = FavoritesStorage.getFavorites()

        do {
            guard let id = userId else {
                throw UserError.noUser
            }
            let serverFavoritesSet = Set(try await APIUserHandler.getUserFavoritesIds(userId: id))
            favoriteShows.removeAll { !serverFavoritesSet.contains($0.apiId) }

            for showId in serverFavoritesSet {
                if !favoriteShows.contains(where: { $0.apiId == showId }) {
                    let show = try await APIShowHandler.getShow(id: showId)
                    favoriteShows.append(show)
                }
            }

            FavoritesStorage.saveFavorites(favoriteShows)
            favoritesUpdated = true
        } catch {
            print("Failed to load or update favorites: \(error)")
        }
    }

    
    func addUserFavorite(_ apiId: Int) async -> Bool {
        if userId == nil {
            return false
        }
        do {
            try await APIUserHandler.addUserFavorite(userId: userId!, showId: apiId)
            let show = try await APIShowHandler.getShow(id: apiId)
            favoriteShows.append(show)
            saveFavorites()
            return true
        } catch {
            print("Failed to add \(apiId)")
            return false
        }
    }
    
    func removeUserFavorite(_ apiId: Int) async -> Bool {
        if userId == nil {
            return false
        }
        do {
            try await APIUserHandler.removeUserFavorite(userId: userId!, showId: apiId)
            favoriteShows.removeAll { $0.apiId == apiId }
            saveFavorites()
            return true
        } catch {
            print("Failed to save \(apiId)")
            return false
        }
    }
    
    func isFavorite(_ apiId: Int) -> Bool {
        return favoriteShows.contains(where: {$0.apiId == apiId})
    }
}

enum UserError: Error {
    case noUser
}

@MainActor
class UserViewModelPreview: UserViewModel {
    override init(_ loggedIn: Bool = true) {
        super.init()
        user = nil
        userId = nil
    }

    override func login(email: String, password: String) async -> Bool {
        userId = 1
        user = User(email: email, password: password)
        return true
    }

    override func logout() {
        userId = nil
        user = nil
    }

    override func register(email: String, password: String) async -> Bool {
        userId = 1
        user = User(email: email, password: password)
        return true
    }

    override func saveFavorites() {
        return
    }

    override func loadFavorites() async {
        return
    }

    override func addUserFavorite(_ apiId: Int) async -> Bool {
        return true
    }

    override func removeUserFavorite(_ apiId: Int) async -> Bool {
        return true
    }
}   
