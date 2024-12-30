import SwiftUI

struct SeriesView: View {
    @StateObject
    private var vm: SeriesViewModel = SeriesViewModel()

    let id: Int
    
    var body: some View {
        VStack {
            Text(series.title)
                .font(.title)
                .padding()
            
            Text("\(series.firstAirYear) - \(series.lastAirYear)")
                .padding()
            
            Spacer()
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
