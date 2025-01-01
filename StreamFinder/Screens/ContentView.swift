import SwiftUI

struct Constants {
    static let bgColor = Color(red: 0.12, green: 0.12, blue: 0.12)
    static let fgColor = Color(red: 0.96, green: 0.94, blue: 0.97)
    static let selectedItemColor = Color(.white)
    static let unselectedItemColor = Color(.white.opacity(0.55))
    static let tabBgColor = Color(red: 0.14, green: 0.14, blue: 0.14)
}

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            BackGroundView()
            if userViewModel.isUserLoggedIn || userViewModel.isGuest {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

struct BackGroundView: View {
    var body: some View {
        ContainerRelativeShape()
            .fill(Constants.bgColor)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
