import SwiftUI

class StreamingOptionsViewModel: ObservableObject {
    @Published var streamingOptions: [String: [StreamingOption]]
    @Published var currentStreamingOption: StreamingOption?
    @Published var currentCountry: Country?
    
    init(streamingOptions: [String : [StreamingOption]], appSettings: AppSettings) {
        self.streamingOptions = streamingOptions
        let countryKey = appSettings.preferedCountry.rawValue
        if streamingOptions[countryKey] != nil {
            currentCountry = appSettings.preferedCountry
        }
        if let country = currentCountry {
            self.currentStreamingOption = findStreamingOptionForKey(key: country.rawValue, acceptableServices: appSettings.streamingServices)
        }
        if (currentStreamingOption == nil) {
            for country in streamingOptions.keys {
                if currentCountry == nil || currentStreamingOption == nil {
                    if let streamingOption = findStreamingOptionForKey(key: country, acceptableServices: appSettings.streamingServices) {
                        currentCountry = Country(rawValue: country)
                        currentStreamingOption = streamingOption
                    }
                }
            }
        }
        if (currentCountry == nil || currentStreamingOption == nil) {
            if let options = streamingOptions[countryKey] {
                currentCountry = appSettings.preferedCountry
                currentStreamingOption = options.first
            } else {
                if let options = streamingOptions.first {
                    currentCountry = Country(rawValue: options.key)
                    print(currentCountry?.getImageName() ?? "err")
                    print(options.key)
                    currentStreamingOption = options.value.first
                    print(options.value.first ?? "1")
                }
            }
        }
    }
    
    func findStreamingOptionForKey(key: String, acceptableServices: [StreamingService]) -> StreamingOption? {
        guard let options = streamingOptions[key] else {
            return nil
        }

        return options.first { option in
            acceptableServices.contains(option.service)
        }
    }


    func watch() {
        if let url = currentStreamingOption?.url {
            UIApplication.shared.open(URL(string: url)!)
        }
    }
}
