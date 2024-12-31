import SwiftUI

class APINewsHandler: APIHandler {
    static func getNews() async throws -> [News] {
        let url = URL(string: "\(self.url)/article/recent")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([News].self, from: data)
    }

    static func getArticle(id: Int) async throws -> Article {
        let url = URL(string: "\(self.url)/article/\(id)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Article.self, from: data)
    }
}