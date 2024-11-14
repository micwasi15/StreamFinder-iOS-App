import SwiftUI

struct ShowView: View {
    var show: Show

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: show.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(show.title)
                .font(.title)
                .padding()
            Text("\(show.year)")
                .font(.subheadline)
                .padding()
        }
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(show: MockData.shows[0])
    }
}
