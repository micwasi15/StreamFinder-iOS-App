import SwiftUI

struct ArticleView: View {
    @StateObject 
    var vm: ArticleViewModel = ArticleViewModel()
    let id: Int
    
    var body: some View {
        ScrollView {
            VStack {
                if vm.isLoading {
                    ProgressView("Loading article...")
                } else if let article = vm.article {
                    AsyncImage(url: URL(string: article.imageURL)) { image in
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
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text(article.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(article.content)
                            .font(.body)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                } else if let errorMessage = vm.errorMessage {
                    Text(errorMessage)
                        .padding()
                }
            }
        }
        .onAppear {
            vm.fetchArticle(id: id)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(id: 11)
    }
}