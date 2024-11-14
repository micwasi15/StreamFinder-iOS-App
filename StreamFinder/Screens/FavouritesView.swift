import SwiftUI

struct FavouritesView: View {
    @State private var searchText = ""
    @State private var shows: [Show] = []
    @State private var selectedShow: Show? = nil
    @State private var isLoading = false

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search...", text: $searchText, onCommit: {
                    Task {
                        await searchShows(for: searchText)
                    }
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                if isLoading {
                    ProgressView("Loading...") 
                } else if let errorMessage = errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(shows) { show in
                                NavigationLink(destination: show.isMovie ? AnyView(FilmView(show: show)) : AnyView(SeriesView(show: show))) {
                                    ShowView(show: show)
                                }
                            }
                        }
                        .padding()
                    }
                    .background(Constants.GraysGray6)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
    
    func searchShows(for query: String) async {
        await Task.sleep(3 * 1_000_000_000)
        self.shows = MockData.shows
        return

        isLoading = true

        let apiURL = "https://api.example.com/shows/search?query=\(query)"
        
        guard let url = URL(string: apiURL) else {
            isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedShows = try JSONDecoder().decode([Show].self, from: data)
            DispatchQueue.main.async {
                self.shows = decodedShows
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}