import SwiftUI

struct Film: Identifiable, Decodable {
    var id = UUID()
    var apiId: Int
    var title: String
    var year: Int
    var posterURL: String
    var trailerURL: String?
    var imdbRating: Double
    var streamingOptions: [String: [StreamingOption]]
    var description: String

    enum CodingKeys: String, CodingKey {
        case apiId = "id"
        case title = "title"
        case year = "releaseYear"
        case trailerURL = "trailerURL"
        case imdbRating = "rating"
        case streamingOptions = "streamingOptions"
        case description = "overview"
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
        year = try container.decode(Int.self, forKey: .year)
        trailerURL = try? container.decodeIfPresent(String.self, forKey: .trailerURL)
        imdbRating = try container.decode(Double.self, forKey: .imdbRating) / 10
        streamingOptions = try container.decode([String: [StreamingOption]].self, forKey: .streamingOptions)
        description = try container.decode(String.self, forKey: .description)

        if let posterSetContainer = try? container.nestedContainer(keyedBy: PosterKeys.self, forKey: .posterSet),
           let horizontalPosterContainer = try? posterSetContainer.nestedContainer(keyedBy: HorizontalPosterKeys.self, forKey: .horizontalPoster),
           let w480 = try? horizontalPosterContainer.decode(String.self, forKey: .w480) {
            posterURL = w480
        } else {
            throw DecodingError.dataCorruptedError(forKey: .posterSet, in: container, debugDescription: "Missing or invalid poster URL")
        }
    }
}
