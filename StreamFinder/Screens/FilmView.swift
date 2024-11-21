import SwiftUI

struct FilmView: View {
    let film: Film
    
    var body: some View {
        VStack {
            Text(film.title)
                .font(.title)
                .padding()
            
            Text(film.description)
                .padding()
            
            Spacer()
        }
        .navigationTitle(film.title)
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(film: MockData.films[0])
    }
}
