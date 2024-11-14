import SwiftUI

struct NewsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Ekran z newsami")
                // Reszta Twojego widoku z newsami
            }
            .navigationTitle("Newsy")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}