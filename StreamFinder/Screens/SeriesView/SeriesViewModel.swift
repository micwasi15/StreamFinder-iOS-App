import SwiftUI

class SeriesViewModel: ObservableObject {
    @Published var series: Series?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchSeries(id: Int) {
        Task {
            do {
                isLoading = true
                let fetchedSeries = try await APIShowHandler.getSeries(id: id)
                DispatchQueue.main.async {
                    self.series = fetchedSeries
                    self.isLoading = false
                    print(fetchedSeries)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch series: \(error.localizedDescription)"
                    self.isLoading = false
                    print(self.errorMessage)
                }
            }
        }
    }
}
