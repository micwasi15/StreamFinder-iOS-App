import SwiftUI

class FilmViewModel: ObservableObject {
    @Published var film: Film = MockData.films[0]
    
    func fetchFilm() {
        let url = "http://192.168.22.124:8080/api/shows?id=100"
        fetchShow(from: url) {
            result in
            switch result {
            case .success(let showJson):
                print(showJson)
                self.film = Film(apiId: showJson.apiId, title: showJson.title, year: 1, posterURL: "String", trailerURL: "String", imdbRating: 1.0, streamingOptions: [], description: "desc")
            case .failure(let error):
                print(error)
            }
        }
    }
}
