import SwiftUI

struct StreamingServicesView: View {
    // Przykładowy słownik z danymi
    var streamingData: [String: [StreamingOption]]
    
    var onSelect: ((_ key: String, _ option: StreamingOption) -> Void)
    
    @Environment(\.dismiss) var dismiss


    var body: some View {
        VStack {
            // Tabela z danymi
            List {
                ForEach(streamingData.keys.sorted(), id: \.self) { key in
                    HStack {
                        if let img = Image.fromFlagsFolder(named: (Country(rawValue: key)?.getImageName())!){
                            // Pierwsza kolumna: Klucz (obrazek)
                            img
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        // Druga kolumna: Pozioma lista StreamingOption (obrazki)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(streamingData[key]!, id: \.id) { option in
                                    Button(action: {
                                        // Obsługa kliknięcia na StreamingOption
                                        onSelect(key, option)
                                        print(option)
                                        dismiss()
                                    }) {
                                        // Obrazek StreamingOption
                                        if let img = Image.fromFlagsFolder(named: option.service.rawValue) {
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
