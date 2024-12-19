import Foundation

struct AnyDecodable: Decodable {
    let value: Any

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let stringValue = try? container.decode(String.self) {
            value = stringValue
        } else if let intValue = try? container.decode(Int.self) {
            value = intValue
        } else if let doubleValue = try? container.decode(Double.self) {
            value = doubleValue
        } else if let boolValue = try? container.decode(Bool.self) {
            value = boolValue
        } else if let nestedDictionary = try? container.decode([String: AnyDecodable].self) {
            value = nestedDictionary
        } else if let arrayValue = try? container.decode([AnyDecodable].self) {
            value = arrayValue
        } else {
            throw DecodingError.typeMismatch(AnyDecodable.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Type not supported"))
        }
    }
}

struct ShowJson: Decodable {
    let id: Int
    let apiId: Int
    let title: String
    let showType: String
    let jsonData: [String: AnyDecodable]
}

func fetchShow(from url: String, completion: @escaping (Result<ShowJson, Error>) -> Void) {
    guard let apiUrl = URL(string: url) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 1, userInfo: nil)))
        return
    }

    let task = URLSession.shared.dataTask(with: apiUrl) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(NSError(domain: "No Data", code: 2, userInfo: nil)))
            return
        }

        do {
            print(data)
            print(response)
            let decoder = JSONDecoder()
            let show = try decoder.decode(ShowJson.self, from: data)
            completion(.success(show))
        } catch {
            completion(.failure(error))
        }
    }

    task.resume()
}
