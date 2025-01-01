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

enum StreamingService: String, Decodable, Encodable {
    case unknown = "unknown"
    case netflix = "netflix"
    case hulu = "hulu"
    case amazon = "amazon"
    case disney = "disney"
    case hbo = "hbo"
    case apple = "apple"
    case peacock = "peacock"
    case paramount = "paramount"
}

enum Country: String, Decodable, Encodable {
    case us
    case uk
    case ca
    case au
    case de
    case fr
    case it
    case es
    case jp
    case br
    case mx
    case nl
    case se
    case no
    case dk
    case fi
    case ru
    case kr
    case cn
    case tw
    case hk
    case sg
    case id
    case th
    case ph
    case my
    case vn
    case pl
    case cz
    case hu
    case sk
    case at
    case ch
    case be
    case pt
    case ie
    case gr
    case tr
    case ar
    case cl
    case co
    case pe
    case ve
    case ec
    case bo
    case uy
    case py
    case pa
    case cr
    case gt
    case sv
    case hn
    case ni
    case rs
    case ind = "in"
    case ua
    case az
    case lt

    func getImageName() -> String {
        switch self {
        case .us: return "icons8-usa-96"
        case .uk: return "icons8-uk-96"
        case .ca: return "icons8-canada-96"
        case .au: return "icons8-australia-96"
        case .de: return "icons8-germany-96"
        case .fr: return "icons8-france-96"
        case .it: return "icons8-italy-96"
        case .es: return "icons8-spain-96"
        case .jp: return "icons8-japan-96"
        case .br: return "icons8-brazil-96"
        case .mx: return "icons8-mexico-96"
        case .nl: return "icons8-netherlands-96"
        case .se: return "icons8-sweden-96"
        case .no: return "icons8-norway-96"
        case .dk: return "icons8-denmark-96"
        case .fi: return "icons8-finland-96"
        case .ru: return "icons8-russia-96"
        case .kr: return "icons8-south-korea-96"
        case .cn: return "icons8-china-96"
        case .tw: return "icons8-taiwan-96"
        case .hk: return "icons8-hong-kong-96"
        case .sg: return "icons8-singapore-96"
        case .id: return "icons8-indonesia-96"
        case .th: return "icons8-thailand-96"
        case .ph: return "icons8-philippines-96"
        case .my: return "icons8-malaysia-96"
        case .vn: return "icons8-vietnam-96"
        case .pl: return "icons8-poland-96"
        case .cz: return "icons8-czech-republic-96"
        case .hu: return "icons8-hungary-96"
        case .sk: return "icons8-slovakia-96"
        case .at: return "icons8-austria-96"
        case .ch: return "icons8-switzerland-96"
        case .be: return "icons8-belgium-96"
        case .pt: return "icons8-portugal-96"
        case .ie: return "icons8-ireland-96"
        case .gr: return "icons8-greece-96"
        case .tr: return "icons8-turkey-96"
        case .ar: return "icons8-argentina-96"
        case .cl: return "icons8-chile-96"
        case .co: return "icons8-colombia-96"
        case .pe: return "icons8-peru-96"
        case .ve: return "icons8-venezuela-96"
        case .ec: return "icons8-ecuador-96"
        case .bo: return "icons8-bolivia-96"
        case .uy: return "icons8-uruguay-96"
        case .py: return "icons8-paraguay-96"
        case .pa: return "icons8-panama-96"
        case .cr: return "icons8-costa-rica-96"
        case .gt: return "icons8-guatemala-96"
        case .sv: return "icons8-el-salvador-96"
        case .hn: return "icons8-honduras-96"
        case .ni: return "icons8-nicaragua-96"
        case .rs: return "icons8-serbia-96"
        case .ind: return "icons8-india-96"
        case .ua: return "icons8-ukraine-96"
        case .az: return "icons8-azerbaijan-96"
        case .lt: return "icons8-lithuania-96"
        }
    }
}


