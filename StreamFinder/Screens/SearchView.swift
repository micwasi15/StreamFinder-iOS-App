import SwiftUI

struct SearchView: View {
    var body: some View {
        ShowsGridView(vm: SearchViewModel())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}