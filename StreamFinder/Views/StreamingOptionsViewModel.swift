import SwiftUI

class StreamingOptionsViewModel: ObservableObject {
    @Published var streamingOptions: [StreamingOption] = MockData.streamingOptions
    @Published var currentStreamingOption: StreamingOption? = MockData.streamingOptions[0]

    func watch() {
        if let url = currentStreamingOption?.url {
            UIApplication.shared.open(URL(string: url)!)
        }
    }
}
