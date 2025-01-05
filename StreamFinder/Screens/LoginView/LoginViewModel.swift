import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isEmailValid: Bool = true
    @Published var isPasswordValid: Bool = true
    @Published var isUserLoggedIn: Bool = false
    @Published var showRegisterView: Bool = false
    @Published var isLoading: Bool = false
    
    @MainActor func login(userViewModel: UserViewModel) {
        self.isEmailValid = LoginDataValidator.validateEmail(email: self.email)
        
        if !isEmailValid {
            return
        }
        
        self.isLoading = true
        Task {
            do {
                await userViewModel.login(email: email, password: password)
            }
        }
        self.isLoading = false

        self.isUserLoggedIn = userViewModel.isUserLoggedIn
        self.isPasswordValid = self.isUserLoggedIn
        
    }

    @MainActor func enterAsGuest(userViewModel: UserViewModel) {
        userViewModel.isGuest = true
    }
}
