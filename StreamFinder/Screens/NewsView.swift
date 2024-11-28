import SwiftUI

struct NewsView: View {
    var vm = NewsViewModel()

    var body: some View {
        NavigationView {
            List(vm.news) { news in
                NavigationLink(destination: ArticleDetailView(article: vm.getArticle(id: news.apiId))) {
                    NewsListCell(news: news)
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
