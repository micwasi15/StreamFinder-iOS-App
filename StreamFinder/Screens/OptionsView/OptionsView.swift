import SwiftUI

struct OptionsView: View {
    @EnvironmentObject
    private var userViewModel: UserViewModel
    
    @EnvironmentObject
    private var appSettings: AppSettings
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack(alignment: .center) {
                    Text("Options")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 22.0)
                .padding(.vertical, 0)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .background(Constants.fgColor)
                    .padding(.horizontal, 20)
                
                if let email = userViewModel.user?.email {
                    Text("\(email)")
                        .font(.title)
                        .fontWeight(.bold)
                } else {
                    Text("You're not logged in")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                
                Divider()
                    .background(Constants.fgColor)
                    .padding(.horizontal, 20)
                
                VStack(spacing: 15) {
                    NavigationLink(destination: ChangeCountryView()) {
                        OptionButtonView(title: "Change preffered country", systemImage: "globe")
                    }
                    
                    NavigationLink(destination: ChangePrefferedServicesView()) {
                        OptionButtonView(title: "Change preffered services", systemImage: "list.dash")
                    }
                    
                    if userViewModel.isUserLoggedIn {
                        Button(action: userViewModel.logout) {
                            OptionButtonView(title: "Log out", systemImage: "arrow.right.square")
                        }
                    } else {
                        Button(action: { userViewModel.setIsGuest(val: false)}) {
                            OptionButtonView(title: "Log in", systemImage: "person.crop.circle.badge.plus")
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            .background(.black)
        }
        .background(Constants.bgColor)
        .foregroundStyle(Constants.fgColor)
    }
}

struct OptionButtonView: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .font(.title2)
            Text(title)
                .font(.headline)
            Spacer()
        }
        .frame(maxHeight: 25)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Constants.secBgColor)
        )
        .shadow(radius: 1)
    }
}

struct ChangeCountryView: View {
    var body: some View {
        Text("Widok zmiany preferowanego kraju")
            .font(.title)
            .padding()
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
            .environmentObject(UserViewModelPreview() as UserViewModel)
            .environmentObject(AppSettings())
            .background(Constants.bgColor)
    }
}
