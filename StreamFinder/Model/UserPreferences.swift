import Foundation

class AppSettings: Decodable, Encodable, ObservableObject {
    var preferedCountry: Country = .us
    var streamingServices: [StreamingService] = [] 
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.preferedCountry = try container.decode(Country.self, forKey: .preferedCountry)
        self.streamingServices = try container.decode([StreamingService].self, forKey: .streamingServices)
    }
    
    init() {
        loadFromMemory()
    }
    
    func loadFromMemory() {
        return
    }
    
    func saveToMemory() {
        return
    }
}
