import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchArticles() {
        Task {
            do {
                DispatchQueue.main.async {
                    isLoading = true
                }
                let fetchedNews = try await APIShowHandler.getNews()
                DispatchQueue.main.async {
                    self.news = fetchedNews
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch news: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
}
