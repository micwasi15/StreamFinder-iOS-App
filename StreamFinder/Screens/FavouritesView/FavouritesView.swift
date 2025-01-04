import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        if userViewModel.isUserLoggedIn {
            ShowsGridView(vm: FavouritesViewModel(userViewModel: userViewModel))
        } else {
            Text("Please log in to view your favourites.")
                .padding()
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
