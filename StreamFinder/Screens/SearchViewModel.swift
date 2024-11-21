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
    
    func searchShows(for query: String) async {
        isLoading = true
        await Task.sleep(3 * 1_000_000_000)
        isLoading = false
        self.shows = [MockData.shows[0]]
        return
    }
}
