import SwiftUI

struct NewsListCell: View {
    var news: News

    var body: some View {
        VStack(alignment: .center, spacing: 15) { 
            HStack(alignment: .center, spacing: 0) { 
                AsyncImage(url: URL(string: news.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding(0)

            HStack(alignment: .top, spacing: 15) { 
                Text(news.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
         }
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity, alignment: .top)
            .background(Constants.secBgColor)

            .cornerRadius(10)

    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(news: MockData.news[0])
    }
}
