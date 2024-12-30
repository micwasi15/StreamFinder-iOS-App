import SwiftUI

struct Series: Identifiable, Decodable {
    var id = UUID()
    var apiId: Int
    var title: String
    var year: Int
    var posterURL: String
    var trailerURL: String
    var imdbRating: Double
    var seasons: [Season]
}

struct Season: Identifiable, Decodable {
    var id = UUID()
    var number: Int
    var year: Int
    var episodes: [Episode]
}

struct Episode: Identifiable, Decodable {
    var id = UUID()
    var number: Int
    var title: String
    var streamingOptions: [Country: [StreamingOption]]
    var description: String
}