import SwiftUI

struct NewsView: View {
    @StateObject
    var vm = NewsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if vm.isLoading {
                    ProgressView("Loading article")
                } else if let _ = vm.errorMessage {
                    NoInternetView()
                } else if let news = vm.news {
                    HStack(alignment: .center) {
                        Text("News")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 22.0)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                        .background(Constants.fgColor)
                        .padding(.horizontal, 20)
                    
                    List(news) { newsElem in
                        ZStack {
                            NewsListCell(news: newsElem)
                            NavigationLink(destination: ArticleView(id: newsElem.apiId)) {
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical, 10)
                        .cornerRadius(8.0)
                        .listRowBackground(Constants.bgColor)
                    }
                    .scrollContentBackground(.hidden)
                    .background(Constants.bgColor)
                }
            }
            .background(Constants.bgColor)
            .foregroundStyle(Constants.fgColor)
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
