import SwiftUI

class FavouritesViewModel: ObservableObject, ShowsGridViewModel {
    @Published var searchText = ""
    @Published var shows: [Show] = []
    @Published var isLoading = false
    @Published var noShowsFoundText = "No shows found."
    @Published var additionalCondText: String = "No favourites yet. Tap the heart icon on a show to add it to your favourites."
    
    private var userViewModel: UserViewModel
    private var noFavorites: Bool = true

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        Task {
            do {
                let favorites = await getFavourites(userViewModel: userViewModel)
                DispatchQueue.main.async {
                    self.shows = favorites
                }
            }
        }
    }

    func searchShows() async {
        Task {
            do {
                DispatchQueue.main.async {
                    self.isLoading = true
                }

                await userViewModel.loadFavorites()
                let fetchedShows = await userViewModel.favoriteShows
                let filteredShows = self.searchText.isEmpty ? fetchedShows : fetchedShows.filter({
                    $0.title.lowercased().contains(self.searchText.lowercased())
                })

                DispatchQueue.main.async {
                    self.noFavorites = fetchedShows.isEmpty
                    self.shows = filteredShows
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }

    func getFavourites(userViewModel: UserViewModel) async -> [Show] {
        return await userViewModel.favoriteShows
    }
    
    func noShowsFound() -> Bool {
        return !noFavorites && shows.isEmpty
    }
    
    func additionalCond() -> Bool {
        return noFavorites
    }
    
    func onAppear() async {
        await searchShows()
    }
}
