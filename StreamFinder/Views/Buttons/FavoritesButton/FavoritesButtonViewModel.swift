import SwiftUI
import AVFoundation

@MainActor
class FavoritesButtonViewModel: ObservableObject {
    @Published var isLiked: Bool
    @Published var showErrorAlert = false
    @Published var errorMessage = ""

    private let apiId: Int
    private let userViewModel: UserViewModel
    private var audioPlayer: AVAudioPlayer?

    private let failedToAddErr = "Failed to add show to favorites"
    private let failedToRemoveErr = "Failed to remove show from favorites"
    private let notLoggedInErr = "You must be logged in to add a show to your favorites"

    init(apiId: Int, userViewModel: UserViewModel) {
        self.apiId = apiId
        self.userViewModel = userViewModel
        self.isLiked = userViewModel.isFavorite(apiId)
        prepareSound()
    }

    func toggleLike() async {
        do {
            isLiked.toggle()
            playSound()
            if !userViewModel.isUserLoggedIn {
                showError(notLoggedInErr)
                isLiked.toggle()
            }
            else if isLiked {
                guard await userViewModel.addUserFavorite(apiId) else {
                    showError(failedToAddErr)
                    isLiked.toggle()
                    return
                }
            } else {
                guard await userViewModel.removeUserFavorite(apiId) else {
                    showError(failedToRemoveErr)
                    isLiked.toggle()
                    return
                }
            }
        }
    }

    private func prepareSound() {
        guard let url = Bundle.main.url(forResource: "heartClick", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Failed to load sound: \(error)")
        }
    }

    private func playSound() {
        audioPlayer?.play()
    }

    private func showError(_ message: String) {
        errorMessage = message
        showErrorAlert = true
    }
}
