import SwiftUI

struct FilmView: View {
    let show: Show
    
    var body: some View {
        VStack {
            Text(show.title)
                .font(.title)
                .padding()
            
            Text(show.description)
                .padding()
            
            Spacer()
        }
        .navigationTitle(show.title)
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(show: MockData.shows[1])
    }
}