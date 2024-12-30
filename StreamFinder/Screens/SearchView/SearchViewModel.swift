import SwiftUI

class SearchViewModel: ShowsGridViewModel, ObservableObject {
    @Published var searchText = ""
    @Published var shows: [Show] = []
    @Published var isLoading = false
    @Published var showsEmptyText = "No shows found."

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func searchShows() {
        isLoading = true
        shows = []
        showsEmptyText = "No shows found."
        
        guard !searchText.isEmpty else {
            isLoading = false
            return
        }
        
        ShowsService.shared.searchShows(query: searchText) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let shows):
                    self?.shows = shows
                    self?.showsEmptyText = "No shows found."
                case .failure(let error):
                    self?.showsEmptyText = error.localizedDescription
                }
            }
        }
    }
}
