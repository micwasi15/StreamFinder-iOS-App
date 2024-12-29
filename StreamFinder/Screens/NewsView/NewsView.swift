import SwiftUI

struct NewsView: View {
    var vm = NewsViewModel()

    var body: some View {
        NavigationView {
            List(vm.news) { news in
                ZStack{
                    NewsListCell(news: news)
                    NavigationLink(destination: ArticleDetailView(article: vm.getArticle(id: news.apiId))) {
                        EmptyView()
                    }
                    .buttonStyle(PlainButtonStyle())
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
