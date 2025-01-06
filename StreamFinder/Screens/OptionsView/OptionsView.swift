import SwiftUI

struct OptionsView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var appSettings: AppSettings
    
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
                
                if let user = userViewModel.user, userViewModel.isUserLoggedIn {
                    Text("\(user.email)")
                        .font(.title)
                        .fontWeight(.bold)
                } else {
                    Text("You're not logged in")
                        .font(.title2)
                }
                
                Divider()
                    .background(Constants.fgColor)
                    .padding(.horizontal, 20)
                
                VStack(spacing: 15) {
                    NavigationLink(destination: ChangePrefferedCountryView()) {
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
                        Button(action: { userViewModel.isGuest = false}) {
                            OptionButtonView(title: "Log in", systemImage: "person.crop.circle.badge.plus")
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            .background(Constants.bgColor)
        }
        .background(Constants.bgColor)
        .foregroundStyle(Constants.fgColor)
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
