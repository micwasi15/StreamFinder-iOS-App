import SwiftUI

struct StreamingOption: Identifiable, Decodable {
    var id = UUID()
    var service: StreamingService
    var url: String

    enum CodingKeys: String, CodingKey {
        case service
        case url = "link"
    }

    enum ServiceKeys: String, CodingKey {
        case id
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let serviceContainer = try container.nestedContainer(keyedBy: ServiceKeys.self, forKey: .service)
        let serviceId = try serviceContainer.decode(String.self, forKey: .id)
        if let parsedService = StreamingService(rawValue: serviceId) {
            service = parsedService
        } else {
            service = .unknown
        }
        url = try container.decode(String.self, forKey: .url)
    }
    
    init(service: StreamingService, url: String) {
        self.service = service
        self.url = url
    }
}

enum StreamingService: String, Decodable, Encodable, Comparable {
    case unknown = "unknown"
    case netflix = "netflix"
    case hulu = "hulu"
    case amazon = "amazon"
    case disney = "disney"
    case hbo = "hbo"
    case apple = "apple"
    case peacock = "peacock"
    case paramount = "paramount"

    func getFullName() -> String {
        switch self {
        case .unknown:
            return "Unknown"
        case .netflix:
            return "Netflix"
        case .hulu:
            return "Hulu"
        case .amazon:
            return "Amazon Prime Video"
        case .disney:
            return "Disney+"
        case .hbo:
            return "HBO Max"
        case .apple:
            return "Apple TV+"
        case .peacock:
            return "Peacock"
        case .paramount:
            return "Paramount+"
        }
    }
    
    static func < (lhs: StreamingService, rhs: StreamingService) -> Bool {
        return lhs.getFullName() < rhs.getFullName()
    }
    
    static func allServices() -> [StreamingService] {
        return [
            .netflix,
            .hulu,
            .amazon,
            .disney,
            .hbo,
            .apple,
            .peacock,
            .paramount
        ]
    }
}

