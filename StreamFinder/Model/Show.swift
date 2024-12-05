import SwiftUI

struct Show: Identifiable, Decodable {
    var id = UUID()
    var apiId: Int
    var title: String
    var yearRange: String
    var posterURL: String
    var showType: ShowType
}

struct Film: Identifiable, Decodable {
    var id = UUID()
    var apiId: Int
    var title: String
    var year: Int
    var posterURL: String
    var trailerURL: String
    var imdbRating: Double
    var streamingOptions: [StreamingOption]
    var description: String
}

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
    var streamingOptions: [StreamingOption]
    var description: String
}

struct StreamingOption: Identifiable, Decodable {
    var id = UUID()
    var service: StreamingService
    var country: Country
    var url: String
}

enum ShowType: String, Decodable {
    case movie
    case series
}

enum StreamingService: String, Decodable {
    case netflix = "netflix"
    case hulu = "hulu"
    case amazon = "amazon"
    case disney = "disney-plus-logo"
    case hbo = "max-logo"
    case apple = "apple"
    case peacock = "peacock"
}

enum Country: String, Decodable {
    case us = "icons8-usa-96"
    case uk
    case ca
    case au
    case de
    case fr
    case it
    case es
    case jp
    case br
    case mx
    case nl
    case se
    case no
    case dk
    case fi
    case ru
    case kr
    case cn
    case tw
    case hk
    case sg
    case id
    case th
    case ph
    case my
    case vn
    case pl
    case cz
    case hu
    case sk
    case at
    case ch
    case be
    case pt
    case ie
    case gr
    case tr
    case ar
    case cl
    case co
    case pe
    case ve
    case ec
    case bo
    case uy
    case py
    case pa
    case cr
    case gt
    case sv
    case hn
    case ni
}
