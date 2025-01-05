import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        if userViewModel.isUserLoggedIn {
            ShowsGridView(vm: FavouritesViewModel(userViewModel: userViewModel))
        } else {
            VStack {
                Text("Please log in to view your favourites.")
                    .padding()
                
                Button(action: {
                    userViewModel.isGuest = false
                }) {
                    SimpleButtonView(text: "Log in", bgColor: Constants.secBgColor)
                        .padding(.horizontal, 50)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Constants.bgColor)
            .foregroundStyle(Constants.fgColor)
        }
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environmentObject(UserViewModelPreview() as UserViewModel)
            .background(Constants.bgColor)
            .foregroundStyle(Constants.fgColor)
    }
}
