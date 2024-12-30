import SwiftUI

import Foundation

class Show: Identifiable, Decodable {
    var id = UUID()
    var apiId: Int
    var title: String
    var yearRange: String
    var posterURL: String
    var showType: ShowType

    enum CodingKeys: String, CodingKey {
        case apiId = "id"
        case title = "title"
        case year = "releaseYear"
        case firstYear = "firstAirYear"
        case lastYear = "lastAirYear"
        case showType = "showType"
    }

    enum ImageSetKeys: String, CodingKey {
        case horizontalPoster
    }
    
    enum HorizontalPosterKeys: String, CodingKey {
        case w360
        case w480
        case w600
        case w720
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        apiId = try container.decode(Int.self, forKey: .apiId)
        title = try container.decode(String.self, forKey: .title)
        showType = try container.decode(ShowType.self, forKey: .showType)

        if showType == .movie {
            let year = try container.decode(Int.self, forKey: .year)
            yearRange = "\(year)"
        } else {
            let firstYear = try container.decode(Int.self, forKey: .firstYear)
            let lastYear = try container.decode(Int.self, forKey: .lastYear)
            yearRange = "\(firstYear)-\(lastYear)"
        }

        if let imageSetContainer = try? container.nestedContainer(keyedBy: ImageSetKeys.self, forKey: .imageSet),
           let horizontalPosterContainer = try? imageSetContainer.nestedContainer(keyedBy: HorizontalPosterKeys.self, forKey: .horizontalPoster),
           let w480 = try? horizontalPosterContainer.decode(String.self, forKey: .w480) {
            posterURL = w480
        } else {
            posterURL = ""
        }
    }

    init(apiId: Int, title: String, yearRange: String, posterURL: String, showType: ShowType) {
        self.apiId = apiId
        self.title = title
        self.yearRange = yearRange
        self.posterURL = posterURL
        self.showType = showType
    }
}

enum ShowType: String, Decodable {
    case movie
    case series
}