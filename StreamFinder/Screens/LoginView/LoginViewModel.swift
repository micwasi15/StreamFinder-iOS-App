import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var isUserLoggedIn: Bool = false
    
    @MainActor func login(userViewModel: UserViewModel) {
        DispatchQueue.main.async {
            isEmailValid = LoginDataValidator.validateEmail(email: email)
            isPasswordValid = LoginDataValidator.validatePassword(password: password)
        }

        if !isEmailValid || !isPasswordValid {
            return
        }
        
        Task {
            do {
                await userViewModel.login(email: email, password: password)
            }
        }

        DispatchQueue.main.async {
            isUserLoggedIn = userViewModel.isUserLoggedIn
        }
    }

    @MainActor func enterAsGuest(userViewModel: UserViewModel) {
        userViewModel.setIsGuest(val: true)
    }
}
