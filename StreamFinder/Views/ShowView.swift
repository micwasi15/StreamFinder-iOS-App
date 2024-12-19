import SwiftUI

struct ShowView: View {
    var show: Show

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: show.posterURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8.0)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
            }
            Text(show.title)
                .font(.subheadline)
                .foregroundStyle(.black)
            Text(show.yearRange)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
        .frame(width: 185.0, alignment: .topLeading)
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(show: MockData.shows[1])
    }
}
