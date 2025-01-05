import Foundation

class UserStorage {
    private let userDefaultsKey = "user"

    func saveUser(_ user: User) throws {
        let encoder = JSONEncoder()
        do {
            let userData = try encoder.encode(user)
            UserDefaults.standard.set(userData, forKey: userDefaultsKey)
        } catch {
            throw error
        }
    }

    func loadUser() throws -> User? {
        guard let userData = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(User.self, from: userData)
        } catch {
            throw error
        }
    }

    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
