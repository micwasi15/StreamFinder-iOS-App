import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var news: [News] = MockData.news

    func fetchArticles() {
        news = MockData.news
    }
    
    func getArticle(id: Int) -> Article {
        return MockData.articles[0];
    }
}
