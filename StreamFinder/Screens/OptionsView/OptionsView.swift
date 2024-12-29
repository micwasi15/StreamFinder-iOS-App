import SwiftUI

struct OptionsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Ekran z opcjami")
                // Reszta Twojego widoku z newsami
            }
            .navigationTitle("Opcje")
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}