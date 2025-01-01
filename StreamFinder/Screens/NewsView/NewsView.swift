import SwiftUI

struct NewsView: View {
    @StateObject
    var vm = NewsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if vm.isLoading {
                    ProgressView("Loading article")
                } else if let errorMessage = vm.errorMessage {
                    Text("Error: \(errorMessage)")
                } else if let news = vm.news {
                    HStack(alignment: .center, spacing: 10) {
                        Text("News")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 22.0)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    List(news) { newsElem in
                        ZStack{
                            NewsListCell(news: newsElem)
                            NavigationLink(destination: ArticleView(id: newsElem.apiId)) {
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical, 5)
                        .cornerRadius(8.0)
                    }
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
