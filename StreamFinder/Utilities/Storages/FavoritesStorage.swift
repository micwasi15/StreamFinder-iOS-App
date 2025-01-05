import Foundation

class FavoritesStorage {
    
    private static let favoritesKey = "favorites"
    
    private static func favoritesToStructs(_ favorites: [Show]) -> [ShowStruct] {
        return favorites.map({
            ShowStruct.fromClass(show: $0)
        })
    }
    
    private static func structToClass(_ structs: [ShowStruct]) -> [Show] {
        return structs.map { $0.toClass() }
    }
    
    static func saveFavorites(_ favorites: [Show]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(favoritesToStructs(favorites))
            UserDefaults.standard.set(data, forKey: favoritesKey)
        } catch {
            print("Failed to save favorites: \(error)")
        }
    }
    
    static func getFavorites() -> [Show] {
        if let data = UserDefaults.standard.data(forKey: favoritesKey) {
            do {
                let decoder = JSONDecoder()
                let favorites = try decoder.decode([ShowStruct].self, from: data)
                return structToClass(favorites)
            } catch {
                print("Failed to load favorites: \(error)")
            }
        }
        return []
    }
    
    static func removeFavorites() {
        UserDefaults.standard.removeObject(forKey: favoritesKey)
    }
}

