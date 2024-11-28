import SwiftUI

struct NewsListCell: View {
    var news: News

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: news.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(news.title)
                .font(.title)
                .padding()
        }
        .frame(alignment: .topLeading)
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(news: MockData.news[0])
    }
}
