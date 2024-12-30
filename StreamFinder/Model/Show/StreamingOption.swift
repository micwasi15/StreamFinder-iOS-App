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
        guard let parsedService = StreamingService(rawValue: serviceId) else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: serviceContainer, debugDescription: "Invalid service ID: \(serviceId)")
        }
        service = parsedService
        url = try container.decode(String.self, forKey: .url)
    }
}

enum StreamingService: String, Decodable {
    case netflix = "netflix"
    case hulu = "hulu"
    case amazon = "amazon"
    case disney = "disney-plus-logo"
    case hbo = "max-logo"
    case apple = "apple"
    case peacock = "peacock"
}

enum Country: String, Decodable {
    case us = "icons8-usa-96"
    case uk = "icons8-uk-96"
    case ca = "icons8-canada-96"
    case au = "icons8-australia-96"
    case de = "icons8-germany-96"
    case fr = "icons8-france-96"
    case it = "icons8-italy-96"
    case es = "icons8-spain-96"
    case jp = "icons8-japan-96"
    case br = "icons8-brazil-96"
    case mx = "icons8-mexico-96"
    case nl = "icons8-netherlands-96"
    case se = "icons8-sweden-96"
    case no = "icons8-norway-96"
    case dk = "icons8-denmark-96"
    case fi = "icons8-finland-96"
    case ru = "icons8-russia-96"
    case kr = "icons8-south-korea-96"
    case cn = "icons8-china-96"
    case tw = "icons8-taiwan-96"
    case hk = "icons8-hong-kong-96"
    case sg = "icons8-singapore-96"
    case id = "icons8-indonesia-96"
    case th = "icons8-thailand-96"
    case ph = "icons8-philippines-96"
    case my = "icons8-malaysia-96"
    case vn = "icons8-vietnam-96" 
    case pl = "icons8-poland-96"
    case cz = "icons8-czech-republic-96"
    case hu = "icons8-hungary-96"
    case sk = "icons8-slovakia-96"
    case at = "icons8-austria-96"
    case ch = "icons8-switzerland-96"
    case be = "icons8-belgium-96"
    case pt = "icons8-portugal-96"
    case ie = "icons8-ireland-96"
    case gr = "icons8-greece-96"
    case tr = "icons8-turkey-96"
    case ar = "icons8-argentina-96"
    case cl = "icons8-chile-96"
    case co = "icons8-colombia-96"
    case pe = "icons8-peru-96"
    case ve = "icons8-venezuela-96"
    case ec = "icons8-ecuador-96"
    case bo = "icons8-bolivia-96"
    case uy = "icons8-uruguay-96"
    case py = "icons8-paraguay-96"
    case pa = "icons8-panama-96"
    case cr = "icons8-costa-rica-96"
    case gt = "icons8-guatemala-96"
    case sv = "icons8-el-salvador-96"
    case hn = "icons8-honduras-96"
    case ni = "icons8-nicaragua-96"
}
