import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "star")
                }

            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            OptionsView()
                .tabItem {
                    Label("Options", systemImage: "person")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}