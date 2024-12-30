import SwiftUI

class StreamingOptionsViewModel: ObservableObject {
    @Published var streamingOptions: [Country: [StreamingOption]] = [:]
    @Published var currentStreamingOption: StreamingOption?
    @Published var currentCountry: Country?

    func watch() {
        if let url = currentStreamingOption?.url {
            UIApplication.shared.open(URL(string: url)!)
        }
    }
}
