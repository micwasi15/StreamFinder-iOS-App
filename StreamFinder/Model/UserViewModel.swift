import SwiftUI

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: User?
    var isUserLoggedIn: Bool {
        userId != nil
    }
    @Published var userId: Int64?
    @Published var favoritesUpdated = false
    @Published var isGuest: Bool = false
    @Published var favoriteShows: [Show] = []
    
    private let userStorage = UserStorage()
    
    init() {
        Task {
            await loadUser()
            await loadFavorites()
        }
    }
    
    func loadUser() async {
        do {
            self.user = try userStorage.loadUser()
            await login(email: user!.email, password: user!.password)
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
    
    func saveFavorites() {
        FavoritesStorage.saveFavorites(favoriteShows)
    }
    
    func loadFavorites() async {
        if favoritesUpdated {
            return
        }
        
        favoriteShows = FavoritesStorage.getFavorites()

        do {
            let serverFavoritesSet = Set(try await APIUserHandler.getUserFavoritesIds(userId: userId!))
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

    
    func addUserFavorite(show: Show) async {
        do {
            try await APIUserHandler.addUserFavorite(userId: userId!, showId: show.apiId)
            favoriteShows.append(show)
            saveFavorites()
        } catch {
            print("Failed to add \(show)")
        }
    }
    
    func removeUserFavorite(show: Show) async {
        do {
            try await APIUserHandler.removeUserFavorite(userId: userId!, showId: show.apiId)
            favoriteShows.removeAll { $0.apiId == show.apiId }
            saveFavorites()
        } catch {
            print("Failed to save \(show)")
        }
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

    override func saveFavorites() {
        return
    }

    override func loadFavorites() async {
        return
    }

    override func addUserFavorite(show: Show) async {
        return
    }

    override func removeUserFavorite(show: Show) async {
        return
    }
}   
