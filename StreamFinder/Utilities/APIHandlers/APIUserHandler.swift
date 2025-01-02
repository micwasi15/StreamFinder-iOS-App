import SwiftUI

class APIUserHandler: APIHandler {
    static func getUserId(email: String, password: String) async throws -> Int64 {
        let url = URL(string: "\(self.url)/users?email=\(email)&password=\(password)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Int64.self, from: data)
    }

    static func createUser(email: String, password: String) async throws -> Int64 {
        let url = URL(string: "\(self.url)/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(User(email: email, password: password))
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Int64.self, from: data)
    }

    static func getUserFavoritesIds(userId: Int64) async throws -> [Int] {
        let url = URL(string: "\(self.url)/users/\(userId)/favorites")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([Int].self, from: data)
    }

    static func addUserFavorite(userId: Int64, showId: Int) async throws {
        let url = URL(string: "\(self.url)/users/\(userId)/favorites/\(showId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }

    static func removeUserFavorite(userId: Int64, showId: Int) async throws {
        let url = URL(string: "\(self.url)/users/\(userId)/favorites/\(showId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }

    static func changePassword(email: String, password: String, newPassword: String) async throws {
        let url = URL(string: "\(self.url)/users?email=\(email)&password=\(password)&newPassword=\(newPassword)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        let (_, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }
}
