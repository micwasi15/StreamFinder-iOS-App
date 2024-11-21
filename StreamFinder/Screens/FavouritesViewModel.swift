import SwiftUI

class FavouritesViewModel: ObservableObject, ShowsGridViewModel {
    @Published var searchText = ""
    @Published var shows: [Show] = MockData.shows
    @Published var isLoading = false
    @Published var showsEmptyText = "No favourites yet. Tap the heart icon on a show to add it to your favourites."

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
        //        isLoading = true
//
//        let apiURL = "https://api.example.com/shows/search?query=\(query)"
//        
//        guard let url = URL(string: apiURL) else {
//            isLoading = false
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decodedShows = try JSONDecoder().decode([Show].self, from: data)
//            DispatchQueue.main.async {
//                self.shows = decodedShows
//                self.isLoading = false
//            }
//        } catch {
//            DispatchQueue.main.async {
//                self.isLoading = false
//            }
//        }
    }

    func getFavourites() -> [Show] {
        return MockData.shows
    }
}
