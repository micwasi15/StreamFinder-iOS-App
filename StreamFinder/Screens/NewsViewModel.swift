import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []

    func fetchArticles() {
        articles = MockData.articles
    }
}