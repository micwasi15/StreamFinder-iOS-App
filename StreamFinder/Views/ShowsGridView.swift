import SwiftUI

protocol ShowsGridViewModel: ObservableObject {
    var searchText: String { get set }
    var shows: [Show] { get set }
    var isLoading: Bool { get set }
    var columns: [GridItem] { get }
    var showsEmptyText: String { get }
    
    func searchShows(for query: String) async
}

struct ShowsGridView<ViewModel: ShowsGridViewModel>: View {
    @StateObject var vm: ViewModel

    var body: some View {
        NavigationView {
            VStack() {
                TextField("Search...", text: $vm.searchText, onCommit: {
                    Task {
                        await vm.searchShows(for: vm.searchText)
                    }
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                Spacer()
                if vm.isLoading {
                    ProgressView("Loading...") 
                } else if vm.shows.isEmpty {
                    Text(vm.showsEmptyText)
                } else {
                    ScrollView {
                        LazyVGrid(columns: vm.columns, spacing: 16) {
                            ForEach(vm.shows) { show in
                                NavigationLink(destination: show.showType == ShowType.series ? AnyView(FilmView(film: MockData.films[0])) : AnyView(SeriesView(series: MockData.series[0]))) {
                                    ShowView(show: show)
                                }
                            }
                        }
                        .padding()
                    }
                    //.background(Constants.GraysGray6)
                }
                Spacer()
            }
            //.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}
