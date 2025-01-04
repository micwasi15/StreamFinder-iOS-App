import SwiftUI

struct ArticleView: View {
    @StateObject 
    var vm: ArticleViewModel = ArticleViewModel()
    let id: Int
    
    var body: some View {
        ScrollView {
            VStack {
                if vm.isLoading {
                    LoadingScreenView(text: "Loading article...")
                } else if let article = vm.article {
                    AsyncImage(url: URL(string: article.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text(article.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                        
                        Divider()
                            .background(.white)
                            .padding(.bottom, 5)
                        
                        Text(article.body)
                            .font(.body)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                    }
                    .padding(12.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                } else if let _ = vm.errorMessage {
                    NoInternetView()
                }
            }
            .padding(.horizontal)
        }
        .background(Color(Constants.bgColor))
        .foregroundStyle(.white)
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
