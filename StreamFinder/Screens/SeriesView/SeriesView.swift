import SwiftUI

struct SeriesView: View {
    @StateObject
    private var vm: SeriesViewModel = SeriesViewModel()

    let id: Int
    
    var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView("Series is loading...")
            } else if let series = vm.series {
                Text(series.title)
                    .font(.title)
                    .padding()
                
                Text("\(series.year)")
                    .padding()
                
                Spacer()
            }
        }
        .onAppear {
            vm.fetchSeries(id: id)
        }
    }
    
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(id: 1000)
    }
}
