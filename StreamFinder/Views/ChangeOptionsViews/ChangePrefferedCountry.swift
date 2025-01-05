import SwiftUI

struct ChangePrefferedCountryView: View {
    @State private var selectedCountry: Country = .us // Domyślnie ustawiony kraj
    @State private var searchQuery: String = ""
    
    private let allCountries = Country.allCases.sorted(by: { $0.getCountryName() < $1.getCountryName() }) // Posortowane kraje
    
    var filteredCountries: [Country] {
        if searchQuery.isEmpty {
            return allCountries
        } else {
            return allCountries.filter {
                $0.getCountryName().lowercased().contains(searchQuery.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Obecnie wybrany kraj
                Section(header: Text("Currently Selected Country").font(.headline)) {
                    HStack {
                        Image(selectedCountry.getImageName())
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(8)
                        Text(selectedCountry.getCountryName())
                            .font(.title3)
                    }
                    .padding()
                }
                
                // Wyszukiwanie kraju
                Section(header: Text("Search Country").font(.headline)) {
                    TextField("Search...", text: $searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                
                // Lista krajów
                List(filteredCountries, id: \.self) { country in
                    Button(action: {
                        withAnimation {
                            selectedCountry = country
                        }
                    }) {
                        HStack {
                            Image(country.getImageName())
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(8)
                            Text(country.getCountryName())
                                .font(.body)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Select Country")
        }
    }
}

struct ChangePrefferedCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePrefferedCountryView()
    }
}
