import SwiftUI

struct FavouritesView: View {
    var body: some View {
        ShowsGridView(vm: FavouritesViewModel())
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
