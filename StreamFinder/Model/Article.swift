import SwiftUI

struct News: Indetifable {
    var id = UUID()
    var apiId: Int
    var title: String
    var imageURL: String
}

struct Article: Identifiable {
    var id = UUID()
    var apiId: Int
    var title: String
    var imageURL: String
    var body: String
}