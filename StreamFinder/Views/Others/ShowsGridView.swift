import SwiftUI

protocol ShowsGridViewModel: ObservableObject {
    var searchText: String { get set }
    var shows: [Show] { get set }
    var isLoading: Bool { get set }
    var columns: [GridItem] { get }
    var noShowsFoundText: String { get }
    var additionalCondText: String { get }
    
    func searchShows() async
    func noShowsFound() -> Bool
    func additionalCond() -> Bool
    func onAppear() async
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
                .foregroundStyle(.black.opacity(0.6))
                .padding()
                
               Spacer()
               if vm.isLoading {
                   LoadingScreenView(text: "Loading...")
               } else if vm.noShowsFound() {
                   Text(vm.noShowsFoundText)
                       .multilineTextAlignment(.center)
                       .padding()
               } else if vm.additionalCond() {
                   Text(vm.additionalCondText)
                       .multilineTextAlignment(.center)
                       .padding()
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
               }
               Spacer()
            }
            .onAppear(perform: {Task {await vm.onAppear()}})
            .background(Constants.bgColor)
            .foregroundStyle(Constants.fgColor)
        }
    }
}
