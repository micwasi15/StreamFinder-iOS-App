import SwiftUI

class ArticleViewModel: ObservableObject {
    @Published var article: Article?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchArticle(id: Int) {
        Task {
            do {
                DispatchQueue.main.async {
                    self.isLoading = true
                }
                let fetchedArticle = try await APINewsHandler.getArticle(id: id)
                DispatchQueue.main.async {
                    self.article = fetchedArticle
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch article: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
}
