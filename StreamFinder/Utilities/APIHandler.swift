import SwiftUI

class APIHandler {
    static let url: String = "localhost:8080"
}

class APIShowHandler: APIHandler {
    static func getShows(title: String) async throws -> [Show] {
        let url = URL(string: "\(self.url)/shows/search/\(title)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([Show].self, from: data)
    }

    static func getFilm(id: Int) async throws -> Film {
        let url = URL(string: "\(self.url)/shows/\(id)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Film.self, from: data)
    }

    static func getSeries(id: Int) async throws -> Series {
        let url = URL(string: "\(self.url)/shows/\(id)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Series.self, from: data)
    }
}

class APIUserHandler: APIHandler {
    static func getUserId(username: String, password: String) async throws -> Int {
        let url = URL(string: "\(self.url)/users?username=\(username)&password=\(password)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Int.self, from: data)
    }

    static func createUser(email: String, password: String) async throws -> Int {
        let url = URL(string: "\(self.url)/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(User(email: email, password: password))
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Int.self, from: data)
    }

    static func getUserFavorites(userId: Int) async throws -> [Show] {
        let url = URL(string: "\(self.url)/users/\(userId)/favorites")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([Show].self, from: data)
    }

    static func addUserFavorite(userId: Int, showId: Int) async throws {
        let url = URL(string: "\(self.url)/users/\(userId)/favorites/\(showId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }

    static func removeUserFavorite(userId: Int, showId: Int) async throws {
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
