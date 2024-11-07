import SwiftUI

struct Constants {
    static let Space0: CGFloat = 0
    static let Space150: CGFloat = 6
    static let GraysGray6: Color = Color(red: 0.95, green: 0.95, blue: 0.97)
    static let IconSmall: CGFloat = 24
    static let BodyLargeTracking: CGFloat = 0.5
    static let SchemesInverseSurface: Color = Color(red: 0.2, green: 0.18, blue: 0.21)
    static let BodyLargeSize: CGFloat = 16
    static let BodyLargeFont: String = "Roboto"
}

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Wyszukiwanie", systemImage: "magnifyingglass")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Ulubione", systemImage: "star")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
        }
        .background(Color(red: 0.5, green: 0.12, blue: 0.12))
    }
}


struct SearchView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Ekran wyszukiwania")
                // Reszta Twojego widoku wyszukiwania
            }
            .navigationTitle("Wyszukiwanie")
        }
    }
}

struct FavoritesView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("VSTACK")
                VStack(alignment: .center, spacing: Constants.Space0) {
                    Text("HELLO")
                }
                .padding(Constants.Space0)
                .frame(width: 402, height: 874, alignment: .top)
                .background(Color(red: 0.12, green: 0.12, blue: 0.12))
                .cornerRadius(0)
            }
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    ContentView()
}
