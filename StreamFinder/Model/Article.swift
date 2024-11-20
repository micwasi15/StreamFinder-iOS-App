import SwiftUI

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var imageURL: String
    var body: String
}