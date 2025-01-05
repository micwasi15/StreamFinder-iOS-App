import SwiftUI

struct OptionsView: View {
    @State private var isLoggedIn: Bool = false // Stan zalogowania użytkownika
    @State private var username: String? = "Użytkownik123" // Nazwa użytkownika, jeśli zalogowany
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Wyświetlanie nazwy użytkownika
                if let username = username, isLoggedIn {
                    Text("Witaj, \(username)!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                } else {
                    Text("Nie jesteś zalogowany")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.top)
                }
                
                Divider()
                
                // Przyciski do opcji
                VStack(spacing: 15) {
                    NavigationLink(destination: ChangeCountryView()) {
                        OptionButtonView(title: "Zmień preferowany kraj", systemImage: "globe")
                    }
                    
                    NavigationLink(destination: ChangeServicesView()) {
                        OptionButtonView(title: "Zmień preferowane serwisy", systemImage: "list.dash")
                    }
                    
                    if isLoggedIn {
                        Button(action: logout) {
                            OptionButtonView(title: "Wyloguj się", systemImage: "arrow.right.square")
                        }
                    } else {
                        Button(action: login) {
                            OptionButtonView(title: "Zaloguj się", systemImage: "person.crop.circle.badge.plus")
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Opcje")
            .padding()
        }
    }
    
    // Funkcja obsługująca logowanie
    private func login() {
        isLoggedIn = true
        username = "NowyUżytkownik"
    }
    
    // Funkcja obsługująca wylogowanie
    private func logout() {
        isLoggedIn = false
        username = nil
    }
}

// Widok przycisku opcji
struct OptionButtonView: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .font(.title2)
                .foregroundColor(.blue)
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray6))
        )
        .shadow(radius: 1)
    }
}

// Przykładowe widoki docelowe
struct ChangeCountryView: View {
    var body: some View {
        Text("Widok zmiany preferowanego kraju")
            .font(.title)
            .padding()
    }
}

struct ChangeServicesView: View {
    var body: some View {
        Text("Widok zmiany preferowanych serwisów")
            .font(.title)
            .padding()
    }
}

// Podgląd
struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
