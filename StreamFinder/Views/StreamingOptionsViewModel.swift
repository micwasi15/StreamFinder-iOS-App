import SwiftUI

class StreamingOptionsViewModel: ObservableObject {
    @Published var streamingOptions: [StreamingOption] = []
    @Published var currentStreamingOption: StreamingOption? = streamingOptions.count > 0 ? streamingOptions[0] : nil

    func watch() {
        if let url = currentStreamingOption?.url {
            UIApplication.shared.open(URL(string: url)!)
        }
    }
}