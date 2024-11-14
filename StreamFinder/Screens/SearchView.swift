import SwiftUI

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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}