import SwiftUI

protocol ShowsGridViewModel: ObservableObject {
    var searchText: String { get set }
    var shows: [Show] { get set }
    var isLoading: Bool { get set }
    var columns: [GridItem] { get }
    var showsEmptyText: String { get }
    
    func searchShows() async
}

struct ShowsGridView<ViewModel: ShowsGridViewModel>: View {
    @StateObject var vm: ViewModel

    var body: some View {
        NavigationView {
            VStack() {
                TextField("Search...", text: $vm.searchText, onCommit: {
                    Task {
                        await vm.searchShows()
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
                               NavigationLink(destination: show.showType == ShowType.series ? AnyView(SeriesView(id: show.apiId)) : AnyView(FilmView(id: show.apiId))) {
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
            .background(Constants.GraysGray6)
            //.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}
