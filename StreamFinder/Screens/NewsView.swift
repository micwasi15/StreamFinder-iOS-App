import SwiftUI

struct NewsView: View {
    var vm = NewsViewModel()

    var body: some View {
        NavigationView {
            List(vm.articles) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    ArticleListCell(article: article)
                }
            }
        }
        // .onAppear {
        //     vm.fetchArticles()
        // }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}