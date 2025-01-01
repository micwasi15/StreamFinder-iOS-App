import SwiftUI

class FilmViewModel: ObservableObject {
    @Published var film: Film? 
    @Published var isLoading: Bool = false  
    @Published var errorMessage: String?

    func fetchFilm(id: Int) {
        Task {
            do {
                DispatchQueue.main.async {
                    self.isLoading = true
                }
                let fetchedFilm = try await APIShowHandler.getFilm(id: id)
                DispatchQueue.main.async {
                    self.film = fetchedFilm
                    self.isLoading = false
                    print(fetchedFilm)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch film: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
}
