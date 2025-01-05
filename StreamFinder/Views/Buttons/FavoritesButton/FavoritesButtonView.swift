import SwiftUI
import AVFoundation

import SwiftUI

struct FavoritesButtonView: View {
    @StateObject private var viewModel: FavoritesButtonViewModel

    init(apiId: Int, userViewModel: UserViewModel) {
        _viewModel = StateObject(wrappedValue: FavoritesButtonViewModel(apiId: apiId, userViewModel: userViewModel))
    }

    var body: some View {
        VStack {
            Button(action: {
                Task {
                    withAnimation(.spring(response: 0.5)) {
                        Task { await viewModel.toggleLike() }
                    }
                }
            }) {
                Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(viewModel.isLiked ? .red : .white)
            }
        }
        .alert("Error", isPresented: $viewModel.showErrorAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}


struct FavoritesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesButtonView(apiId: 1, userViewModel: UserViewModelPreview() as UserViewModel)
            .background(Constants.bgColor)
            .edgesIgnoringSafeArea(.all)
    }
}
