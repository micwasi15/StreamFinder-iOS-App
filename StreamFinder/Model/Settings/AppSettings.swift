import Foundation

class AppSettings: ObservableObject, Codable {
    @Published var preferedCountry: Country = .us
    @Published var streamingServices: [StreamingService] = []
    
    let userDefaultsKey = "AppSettings"
    
    enum CodingKeys: String, CodingKey {
        case preferedCountry
        case streamingServices
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(preferedCountry, forKey: .preferedCountry)
        try container.encode(streamingServices, forKey: .streamingServices)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        preferedCountry = try container.decode(Country.self, forKey: .preferedCountry)
        streamingServices = try container.decode([StreamingService].self, forKey: .streamingServices)
    }

    init() {
        loadFromMemory()
    }
    
    func loadFromMemory() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode(AppSettings.self, from: data) {
            self.preferedCountry = decoded.preferedCountry
            self.streamingServices = decoded.streamingServices
        }
    }
    
    func saveToMemory() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
}

