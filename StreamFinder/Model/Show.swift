import SwiftUI

struct Show: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var imageURL: String
    var rating: Double
    var year: Int
    var episodes: Int
    var seasons: Int
    var genres: [String]
    var trailerURL: String

    var isMovie: Bool {
        return seasons == 0
    }
}