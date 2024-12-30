import SwiftUI

class FilmViewModel: ObservableObject {
    @Published var film: Film = MockData.films[0]
    
    func fetchFilm() {
        
    }
}
