import SwiftUI

struct NewsView: View {
    var vm = NewsViewModel()

    var body: some View {
        NavigationView {
            if vm.isLoading {
                ProgressView()
            } else if let errorMessage = vm.errorMessage {
                Text(errorMessage)
            } else if let news = vm.news {
                HStack(alignment: .center, spacing: 10) {
                    Text("News")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    Rectangle()
                    .inset(by: 0.5)
                    .stroke(.white, lineWidth: 1))
                

                List(vm.news) { news in
                    ZStack{
                        NewsListCell(news: news)
                        NavigationLink(destination: ArticleDetailView(article: vm.getArticle(id: news.apiId))) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .listRowInsets(EdgeInsets())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8.0)
                }
            }
        }
        .onAppear {
            vm.fetchArticles()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
