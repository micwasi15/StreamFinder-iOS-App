import SwiftUI

class SearchViewModel: ShowsGridViewModel, ObservableObject {
    @Published var searchText = ""
    @Published var shows: [Show] = []
    @Published var isLoading = false
    @Published var noShowsFoundText = "No shows found."
    @Published var additionalCondText: String = "Please enter a title in the search bar to find a show."
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func searchShows() {
        if searchText.isEmpty && shows.isEmpty {
            return
        }
        Task {
            do {
                DispatchQueue.main.async {
                    self.isLoading = true
                }
                let fetchedShows = try await APIShowHandler.getShows(title: searchText)
                DispatchQueue.main.async {
                    self.shows = fetchedShows
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
    
    func noShowsFound() -> Bool {
        !searchText.isEmpty && shows.isEmpty
    }
    
    func additionalCond() -> Bool {
        searchText.isEmpty
    }
}

