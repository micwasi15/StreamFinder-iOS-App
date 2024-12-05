import SwiftUI

class FilmViewModel: ObservableObject {
    @Published var films: Film = MockData.films[0]
}
