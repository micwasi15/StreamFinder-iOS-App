import SwiftUI

struct StreamingOptionsView: View {
    @StateObject var vm: StreamingOptionsViewModel
    
    var body: some View {
        if (vm.streamingOptions.count == 0) {
            AnyView(Text("No streaming options available"))
        } else {
            HStack {
                Spacer()
                HStack(alignment: .center, spacing: 10) {
                    if let streamingOption = vm.currentStreamingOption {
                        if let img = Image.fromLogosFolder(named: streamingOption.service.rawValue) {
                            img
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(alignment: .center)
                        }
                    }
                }
                .padding(0)
                .frame(height: 80, alignment: .center)

                HStack(alignment: .center, spacing: 10) {
                    if let streamingOption = vm.currentStreamingOption, let country = vm.currentCountry {
                        if let img = Image.fromFlagsFolder(named: country.getImageName()) {
                            img
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(alignment: .center)
                        }
                    }
                }
                .padding(0)
                .frame(height: 80, alignment: .center)
                
                Spacer()
                
                Text("+\(vm.streamingOptions.count - 1)")
                
                Spacer()

                Button("Watch", action: vm.watch)
                .labelStyle(.titleAndIcon)
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                
                Spacer()
            }
        }
    }
}


struct StreamingOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingOptionsView(vm: StreamingOptionsViewModel(streamingOptions: MockData.streamingOptions1, appSettings: AppSettings()))
    }
}
