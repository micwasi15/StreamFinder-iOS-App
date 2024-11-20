import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = MockData.articles
}