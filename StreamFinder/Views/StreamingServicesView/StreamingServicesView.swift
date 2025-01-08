import SwiftUI

struct StreamingServicesView: View {
    var streamingData: [String: [StreamingOption]]
    var onSelect: ((_ key: String, _ option: StreamingOption) -> Void)
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var appSettings: AppSettings

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Select service")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 22.0)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(Country.getPreffered(countries: streamingData.keys.compactMap({$0}), preffered: appSettings.preferedCountry), id: \.self) { key in
                    HStack {
                        if let img = Image.fromFolder(named: (Country(rawValue: key)?.getImageName())!){
                            img
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Divider()
                            .background(Constants.fgColor)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(streamingData[key]!, id: \.id) { option in
                                    Button(action: {
                                        onSelect(key, option)
                                        dismiss()
                                    }) {
                                        if let img = Image.fromFolder(named: option.service.rawValue) {
                                            img
                                                .resizable()
                                                .cornerRadius(8)
                                                .frame(width: 50, height: 50)
                                        } else {
                                            Image(systemName: "questionmark")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .listRowBackground(Constants.secBgColor)
                    .listRowSeparatorTint(Constants.fgColor)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Constants.bgColor)
        .foregroundStyle(Constants.fgColor)
    }
}

struct StreamingServicesView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingServicesView(streamingData: MockData.streamingOptions, onSelect: {key,option in print(key, option)})
            .environmentObject(AppSettings())
    }
}
