import SwiftUI

enum Country: String, Decodable, Encodable {
    case us
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
    case mk
    case ae
    case il
    case md
    case za
    case bg
    case si
    case cy
    case nz
    case hr
    case ee
    case island = "is"
    case ro
    case gb

    func getImageName() -> String {
        switch self {
        case .us: return "icons8-usa-96"
        case .gb: return "icons8-great-britain-96"
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
        case .hk: return "icons8-hongkong-96"
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
        case .mk: return "icons8-macedonia-96"
        case .ae: return "icons8-united-arab-emirates-96"
        case .il: return "icons8-israel-96"
        case .md: return "icons8-moldova-96"
        case .za: return "icons8-south-africa-96"
        case .bg: return "icons8-bulgaria-96"
        case .si: return "icons8-slovenia-96"
        case .cy: return "icons8-cyprus-96"
        case .nz: return "icons8-new-zealand-96"
        case .hr: return "icons8-croatia-96"
        case .ee: return "icons8-estonia-96"
        case .island: return "icons8-iceland-96"
        case .ro: return "icons8-romania-96"
        }
    }

    func getCountryName() -> String {
        switch self {
        case .us: return "United States"
        case .gb: return "Great Britain"
        case .ca: return "Canada"
        case .au: return "Australia"
        case .de: return "Germany"
        case .fr: return "France"
        case .it: return "Italy"
        case .es: return "Spain"
        case .jp: return "Japan"
        case .br: return "Brazil"
        case .mx: return "Mexico"
        case .nl: return "Netherlands"
        case .se: return "Sweden"
        case .no: return "Norway"
        case .dk: return "Denmark"
        case .fi: return "Finland"
        case .ru: return "Russia"
        case .kr: return "South Korea"
        case .cn: return "China"
        case .tw: return "Taiwan"
        case .hk: return "Hong Kong"
        case .sg: return "Singapore"
        case .id: return "Indonesia"
        case .th: return "Thailand"
        case .ph: return "Philippines"
        case .my: return "Malaysia"
        case .vn: return "Vietnam"
        case .pl: return "Poland"
        case .cz: return "Czech Republic"
        case .hu: return "Hungary"
        case .sk: return "Slovakia"
        case .at: return "Austria"
        case .ch: return "Switzerland"
        case .be: return "Belgium"
        case .pt: return "Portugal"
        case .ie: return "Ireland"
        case .gr: return "Greece"
        case .tr: return "Turkey"
        case .ar: return "Argentina"
        case .cl: return "Chile"
        case .co: return "Colombia"
        case .pe: return "Peru"
        case .ve: return "Venezuela"
        case .ec: return "Ecuador"
        case .bo: return "Bolivia"
        case .uy: return "Uruguay"
        case .py: return "Paraguay"
        case .pa: return "Panama"
        case .cr: return "Costa Rica"
        case .gt: return "Guatemala"
        case .sv: return "El Salvador"
        case .hn: return "Honduras"
        case .ni: return "Nicaragua"
        case .rs: return "Serbia"
        case .ind: return "India"
        case .ua: return "Ukraine"
        case .az: return "Azerbaijan"
        case .lt: return "Lithuania"
        case .mk: return "Macedonia"
        case .ae: return "United Arab Emirates"
        case .il: return "Israel"
        case .md: return "Moldova"
        case .za: return "South Africa"
        case .bg: return "Bulgaria"
        case .si: return "Slovenia"
        case .cy: return "Cyprus"
        case .nz: return "New Zealand"
        case .hr: return "Croatia"
        case .ee: return "Estonia"
        case .island: return "Iceland"
        case .ro: return "Romania"
        }
    }
    
    static func getPreffered(countries: [String], preffered: Country) -> [String] {
        var beggining: [String] = []
        
        if (countries.contains(preffered.rawValue)) {
            beggining.append(preffered.rawValue)
        }
        
        if (countries.contains(Country.us.rawValue)) {
            beggining.append(Country.us.rawValue)
        }
        if (countries.contains(Country.gb.rawValue)) {
            beggining.append(Country.gb.rawValue)
        }
        
        return beggining + countries.sorted()
    }
    
    static let allCases: [Country] = [
            .us, .ca, .au, .de, .fr, .it, .es, .jp, .br, .mx, .nl, .se, .no, .dk, .fi, .ru, .kr, .cn, .tw, .hk, .sg, .id, .th, .ph, .my, .vn, .pl, .cz, .hu, .sk, .at, .ch, .be, .pt, .ie, .gr, .tr, .ar, .cl, .co, .pe, .ve, .ec, .bo, .uy, .py, .pa, .cr, .gt, .sv, .hn, .ni, .rs, .ind, .ua, .az, .lt, .mk, .ae, .il, .md, .za, .bg, .si, .cy, .nz, .hr, .ee, .island, .ro, .gb
        ]
}


