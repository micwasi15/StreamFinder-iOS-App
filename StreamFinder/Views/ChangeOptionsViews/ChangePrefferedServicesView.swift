import SwiftUI

struct ChangePrefferedServicesView: View {
    @State private var otherServices: [StreamingService] = StreamingService.allServices()
    
    @EnvironmentObject
    private var appSetting: AppSettings

    var body: some View {
        NavigationView {
            List {
                if !appSetting.streamingServices.isEmpty {
                    Section(header: Text("Preffered Services")) {
                        ForEach(appSetting.streamingServices.sorted(), id: \.self) { service in
                            HStack {
                                StreamingServiceRow(service: service)
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        removeService(service)
                                    }
                                }) {
                                    Image(systemName: "minus.circle")
                                        .foregroundColor(.red)
                                }
                            }
                            .listRowBackground(Constants.secBgColor)
                            .listRowSeparatorTint(Constants.fgColor)
                        }
                    }
                }

                if !otherServices.isEmpty {
                    Section(header: Text("Other Services")) {
                        ForEach(otherServices.sorted(), id: \.self) { service in
                            HStack {
                                StreamingServiceRow(service: service)
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        addService(service)
                                    }
                                }) {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.green)
                                }
                            }
                            .listRowBackground(Constants.secBgColor)
                            .listRowSeparatorTint(Constants.fgColor)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .foregroundStyle(Constants.fgColor)
            .background(Constants.bgColor)
            .navigationTitle("Preffered Services")
            .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
            .toolbarBackground(Constants.bgColor, for: .navigationBar, .tabBar)
            .toolbarBackground(.visible, for: .navigationBar, .tabBar)
        }
        .onAppear {
            otherServices.removeAll { appSetting.streamingServices.contains($0) }
        }
    }

    private func addService(_ service: StreamingService) {
        withAnimation {
            appSetting.streamingServices.append(service)
            otherServices.removeAll { $0 == service }
        }
        saveChanges()
    }

    private func removeService(_ service: StreamingService) {
        withAnimation {
            otherServices.append(service)
            appSetting.streamingServices.removeAll { $0 == service }
        }
        saveChanges()
    }

    private func saveChanges() {
        appSetting.saveToMemory()
    }
}

struct StreamingServiceRow: View {
    let service: StreamingService

    var body: some View {
        HStack {
            if let img = Image.fromFolder(named: service.rawValue) {
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                    .cornerRadius(8)
            } else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                    .cornerRadius(8)
            }
            Text(service.getFullName())
                .font(.body)
        }
    }
}

struct StreamingServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePrefferedServicesView()
            .environmentObject(AppSettings())
    }
}
