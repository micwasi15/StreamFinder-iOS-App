import SwiftUI

struct Series: Identifiable, Decodable {
    var id = UUID()
    var apiId: Int
    var title: String
    var year: String
    var posterURL: String
    var trailerURL: String?
    var imdbRating: Double
    var seasons: [Season]

    enum CodingKeys: String, CodingKey {
        case apiId = "id"
        case title = "title"
        case firstAirYear = "firstAirYear"
        case lastAirYear = "lastAirYear"
        case trailerURL = "trailerURL"
        case imdbRating = "rating"
        case seasons = "seasons"
        case posterSet = "imageSet"
    }

    enum PosterKeys: String, CodingKey {
        case horizontalPoster = "horizontalPoster"
    }

    enum HorizontalPosterKeys: String, CodingKey {
        case w480
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiId = try container.decode(Int.self, forKey: .apiId)
        title = try container.decode(String.self, forKey: .title)
        year = ""
        if let firstAirYear = try? container.decode(Int.self, forKey: .firstAirYear) {
            year = "\(firstAirYear)"
        }
        if let lastAirYear = try? container.decode(Int.self, forKey: .lastAirYear) {
            year = "\(self.year) - \(lastAirYear)"
        }
        trailerURL = try? container.decodeIfPresent(String.self, forKey: .trailerURL)
        imdbRating = try container.decode(Double.self, forKey: .imdbRating) / 10
        do {
            seasons = try container.decode([Season].self, forKey: .seasons)
        } catch {
            seasons = []
        }

        if let posterSetContainer = try? container.nestedContainer(keyedBy: PosterKeys.self, forKey: .posterSet),
           let horizontalPosterContainer = try? posterSetContainer.nestedContainer(keyedBy: HorizontalPosterKeys.self, forKey: .horizontalPoster),
           let w480 = try? horizontalPosterContainer.decode(String.self, forKey: .w480) {
            posterURL = w480
        } else {
            throw DecodingError.dataCorruptedError(forKey: .posterSet, in: container, debugDescription: "Missing or invalid poster URL")
        }
    }
    
    init(apiId: Int, title: String, year: String, posterUrl: String, imdbRating: Double, seasons: [Season]) {
        self.id = UUID()
        self.apiId = apiId
        self.title = title
        self.year = year
        self.posterURL = posterUrl
        self.imdbRating = imdbRating
        self.seasons = seasons
    }
}

struct Season: Identifiable, Decodable, Hashable {
    var id = UUID()
    var title: String
    var episodes: [Episode]

    enum CodingKeys: String, CodingKey {
        case title
        case episodes
    }
    
    static func == (lhs: Season, rhs: Season) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


struct Episode: Identifiable, Decodable {
    var id = UUID()
    var title: String
    var streamingOptions: [String: [StreamingOption]]
    var description: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case streamingOptions = "streamingOptions"
        case description = "overview"
    }
}
