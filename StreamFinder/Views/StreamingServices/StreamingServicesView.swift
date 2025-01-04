import SwiftUI

struct StreamingServicesView: View {
    // Przykładowy słownik z danymi
    @State private var streamingData: [String: [StreamingOption]] = MockData.streamingOptions
    
    // Przechowujemy informacje o klikniętym elemencie
    @State private var selectedOption: (key: String, option: StreamingOption)?

    var body: some View {
        VStack {
            // Tabela z danymi
            List {
                ForEach(streamingData.keys.sorted(), id: \.self) { key in
                    HStack {
                        if let img = Image.fromFlagsFolder(named: Country(rawValue: key)?.getImageName()){
                            // Pierwsza kolumna: Klucz (obrazek)
                            img. // Możesz zamienić na obrazek odpowiadający kluczowi
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        // Druga kolumna: Pozioma lista StreamingOption (obrazki)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(streamingData[key]!, id: \.id) { option in
                                    Button(action: {
                                        // Obsługa kliknięcia na StreamingOption
                                        selectedOption = (key, option)
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
            
            // Wyświetlanie informacji o klikniętym elemencie
            if let selectedOption = selectedOption {
                Text("Kliknięto: \(selectedOption.option.id) z \(selectedOption.key)")
                    .padding()
            }
        }
        .padding()
    }
}

struct StreamingOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingServicesView()
    }
}
