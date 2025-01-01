import SwiftUI

struct Constants {
    static let Space0: CGFloat = 0
    static let Space150: CGFloat = 6
    static let GraysGray6: Color = Color(red: 0.95, green: 0.95, blue: 0.97)
    static let IconSmall: CGFloat = 24
    static let BodyLargeTracking: CGFloat = 0.5
    static let SchemesInverseSurface: Color = Color(red: 0.2, green: 0.18, blue: 0.21)
    static let BodyLargeSize: CGFloat = 16
    //static let BodyLargeFont: String = "Roboto"
    static let bgColor = Color(red: 0.12, green: 0.12, blue: 0.12)
    static let fgColor = Color(red: 0.96, green: 0.94, blue: 0.97)
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
        .background(Constants.bgColor)
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
