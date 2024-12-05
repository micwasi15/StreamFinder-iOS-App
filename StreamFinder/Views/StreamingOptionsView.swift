import SwiftUI

struct StreamingOptionsView: View {
    let vm: StreamingOptionsViewModel
    
    var body: some View {
        if (vm.streamingOptions.count == 0) {
            return AnyView(Text("No streaming options available"))
        }
        HStack {
            HStack(alignment: .center, spacing: 10) { 
                if let streamingOption = vm.currentStreamingOption {
                    Image.fromLogosFolder(named: streamingOption.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.Icon, height: Constants.Icon, alignment: .center)
                }
            }
            .padding(0)
            .frame(alignment: .center)

            HStack(alignment: .center, spacing: 10) {
                if let streamingOption = vm.currentStreamingOption {
                    Image.fromFlagsFolder(named: streamingOption.country)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.Icon, height: Constants.Icon, alignment: .center)
                }
            }
            .padding(0)
            .frame(alignment: .center)

            Text("+\(vm.streamingOptions.count - 1)")

            Button("Watch", action: vm.watch)
            .labelStyle(.titleAndIcon)
            .buttonStyle(.borderedProminent)
            .controlSize(.small)
        }
    }
}