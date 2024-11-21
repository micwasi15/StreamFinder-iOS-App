import SwiftUI

struct ArticleListCell: View {
    var article: Article

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: article.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(article.title)
                .font(.title)
                .padding()
            Text(article.description)
                .font(.subheadline)
                .padding()
        }
        .frame(alignment: .topLeading)
    }
}

struct ArticleListCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListCell(article: MockData.articles[0])
    }
}
