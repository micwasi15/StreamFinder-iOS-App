import SwiftUI

struct SeriesView: View {
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

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(show: MockData.shows[0])
    }
}