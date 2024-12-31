import SwiftUI

struct News: Identifiable {
    var id = UUID()
    var apiId: Int
    var title: String
    var imageURL: String

    enum CodingKeys: String, CodingKey {
        case apiId = "id"
        case title = "title"
        case imageURL = "image"
    }
}

struct Article: Identifiable {
    var id = UUID()
    var apiId: Int
    var title: String
    var imageURL: String
    var body: String

    enum CodingKeys: String, CodingKey {
        case apiId = "id"
        case title = "title"
        case imageURL = "image"
        case body = "body"
    }
}
