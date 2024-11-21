import SwiftUI

struct SeriesView: View {
    let series: Series
    
    var body: some View {
        VStack {
            Text(series.title)
                .font(.title)
                .padding()
            
            Text("\(series.year)")
                .padding()
            
            Spacer()
        }
        .navigationTitle(series.title)
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(series: MockData.series[0])
    }
}
