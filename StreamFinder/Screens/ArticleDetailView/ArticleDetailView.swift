import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
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
                
                Text(article.body)
                    .padding()
                
                Spacer()
            }
        }
        .navigationTitle(article.title)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: MockData.articles[0])
    }
}