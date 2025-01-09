import SwiftUI

class APIShowHandler: APIHandler {
    static func getShows(title: String) async throws -> [Show] {
        guard let url = URL(string: "\(self.url)/shows/search/\(title)") else {
            print("Couldn't connect to server")
            return []
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([Show].self, from: data)
    }

    static func getShow(id: Int) async throws -> Show {
        let url = URL(string: "\(self.url)/shows/get/\(id)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Show.self, from: data)
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
