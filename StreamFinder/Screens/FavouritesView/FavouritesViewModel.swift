import SwiftUI

class FavouritesViewModel: ObservableObject, ShowsGridViewModel {
    @Published var searchText = ""
    @Published var shows: [Show] = []
    @Published var isLoading = false
    @Published var showsEmptyText = "No favourites yet. Tap the heart icon on a show to add it to your favourites."

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    init() {
        Task {
            do {
                DispatchQueue.main.async {
                    self.shows = await getFavourites()
                }
            }
        }
    }

    func searchShows() async {
        Task {
            return
            do {
                DispatchQueue.main.async {
                    isLoading = true
                }

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

    func getFavourites(userViewModel: UserViewModel) async -> [Show] {
        return await userViewModel.getUserFavorites()
    }
}
