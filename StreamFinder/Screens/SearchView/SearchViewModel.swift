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
            Task {
                do {
                    isLoading = true
                    let fetchedShows = try await APIShowHandler.getShows(title: searchText)
                    DispatchQueue.main.async {
                        self.shows = fetchedShows
                        self.isLoading = false
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.showsEmptyText = "Failed to fetch shows: \(error.localizedDescription)"
                        self.isLoading = false
                    }
                }
            }
        }
    }

