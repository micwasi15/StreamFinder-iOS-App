import SwiftUI

struct ChangePrefferedCountryView: View {
    @EnvironmentObject
    private var appSettings: AppSettings
    
    @State 
    private var searchQuery: String = ""
    
    private let allCountries = Country.allCases.sorted(by: { $0.getCountryName() < $1.getCountryName() })
    
    var filteredCountries: [Country] {
        if searchQuery.isEmpty {
            return allCountries
        } else {
            return allCountries.filter {
                $0.getCountryName().lowercased().contains(searchQuery.lowercased()) || $0.rawValue.contains(searchQuery.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Section(header: Text("Currently preffered country:").font(.headline)) {
                    HStack {
                        if let img = Image.fromFolder(named: appSettings.preferedCountry.getImageName()) {
                            img
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(8)
                        }
                        Text(appSettings.preferedCountry.getCountryName())
                            .font(.title3)
                    }
                    .padding(.bottom)
                }
                
                TextField("Search...", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundStyle(.black.opacity(0.7))
                    .padding(.horizontal)
                
                List(filteredCountries, id: \.self) { country in
                    Button(action: {
                        appSettings.preferedCountry = country
                        appSettings.saveToMemory()
                    }) {
                        HStack {
                            if let img = Image.fromFolder(named: country.getImageName()) {
                                img
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(8)
                            }
                            Text(country.getCountryName())
                                .font(.body)
                        }
                    }
                    .listRowBackground(Constants.bgColor)
                    .listRowSeparatorTint(Constants.fgColor)
                }
                .listStyle(PlainListStyle())
            }
            .padding(.top)
            .background(Constants.bgColor)
            .foregroundStyle(Constants.fgColor)
            .navigationTitle("Select Country")
            .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
            .toolbarBackground(Constants.bgColor, for: .navigationBar, .tabBar)
            .toolbarBackground(.visible, for: .navigationBar, .tabBar)
        }
    }
}

struct ChangePrefferedCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePrefferedCountryView()
            .environmentObject(AppSettings())
    }
}
