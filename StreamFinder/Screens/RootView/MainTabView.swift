import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Group {
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
            .toolbarBackground(Constants.tabBgColor, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
