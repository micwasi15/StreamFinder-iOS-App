import SwiftUI

class SeriesViewModel: ObservableObject {
    @Published var series: Series?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var selectedSeason: Season?

    func fetchSeries(id: Int) {
        Task {
            do {
                print(id)
                DispatchQueue.main.async {
                    self.isLoading = true
                }
                let fetchedSeries = try await APIShowHandler.getSeries(id: id)
                DispatchQueue.main.async {
                    self.series = fetchedSeries
                    self.selectedSeason = self.series?.seasons.first
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch series: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
}
