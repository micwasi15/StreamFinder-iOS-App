import SwiftUI

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
        .background(Constants.bgColor)
        .foregroundStyle(Constants.fgColor)
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
