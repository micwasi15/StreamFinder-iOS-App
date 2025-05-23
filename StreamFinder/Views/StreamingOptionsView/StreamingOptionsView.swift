import SwiftUI

struct StreamingOptionsView: View {
    @StateObject var vm: StreamingOptionsViewModel
    
    var body: some View {
        if (vm.streamingOptions.count == 0) {
            AnyView(Text("No streaming options available"))
                .padding()
                .frame(height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .background(Constants.bgColor)
                .foregroundStyle(Constants.fgColor)
        } else {
                HStack {
                    Spacer()
                    HStack(alignment: .center, spacing: 10) {
                        if let streamingOption = vm.currentStreamingOption {
                            if let img = Image.fromFolder(named: streamingOption.service.rawValue) {
                                img
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(alignment: .center)
                                    .cornerRadius(15)
                            }
                        }
                    }
                    .padding(0)
                    .frame(height: 60, alignment: .center)
                    
                    HStack(alignment: .center, spacing: 10) {
                        if let country = vm.currentCountry {
                            if let img = Image.fromFolder(named: country.getImageName()) {
                                img
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(alignment: .center)
                            }
                        }
                    }
                    .padding(0)
                    .frame(height: 60, alignment: .center)
                    
                    
                    Spacer()
                    
                    Button(action: {
                        vm.isStreamingServicesPresented = true
                        }) {
                            Text("+\(vm.streamingOptions.count - 1)")
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Constants.secBgColor)
                                        .frame(width: 45, height: 45)
                                        .aspectRatio(contentMode: .fill))
                        }
                        .sheet(isPresented: $vm.isStreamingServicesPresented) {
                            StreamingServicesView(streamingData: vm.streamingOptions, onSelect: { key, option in
                                vm.currentCountry = Country(rawValue: key)
                                vm.currentStreamingOption = option
                                vm.isStreamingServicesPresented = false
                            })
                        }
                    
                    Spacer()
                    
                    Button("Watch", action: vm.watch)
                        .labelStyle(.titleAndIcon)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.regular)
                    
                    Spacer()

                    
                }
                .background(Constants.bgColor)
        }
    }
}


struct StreamingOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        StreamingOptionsView(vm: StreamingOptionsViewModel(streamingOptions: MockData.streamingOptions, appSettings: AppSettings()))
            .background(Constants.bgColor)
            .foregroundStyle(Constants.fgColor)
    }
}
