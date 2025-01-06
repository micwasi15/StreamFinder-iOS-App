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
                if let img = Image.fromFolder(named: "poster") {
                    img.resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8.0)
                }
            }
            Text(show.title)
                .lineLimit(2)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Constants.fgColor)
            Text(show.yearRange)
                .font(.caption)
                .foregroundStyle(Constants.fgColor.opacity(0.75))
        }
        .frame(width: .infinity, height: 160, alignment: .topLeading)
        .background(Constants.bgColor)
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(show: MockData.shows[1])
    }
}
