import SwiftUI

struct StreamingServicesView: View {
    var streamingData: [String: [StreamingOption]]
    
    var onSelect: ((_ key: String, _ option: StreamingOption) -> Void)
    
    @Environment(\.dismiss) var dismiss


    var body: some View {
        VStack {
            List {
                ForEach(streamingData.keys.sorted(), id: \.self) { key in
                    HStack {
                        if let img = Image.fromFolder(named: (Country(rawValue: key)?.getImageName())!){
                            img
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
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
                }
            }
        }
    }
}

struct StreamingServicesView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingServicesView(streamingData: MockData.streamingOptions, onSelect: {key,option in print(key, option)})
    }
}
