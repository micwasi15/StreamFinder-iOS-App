import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isEmailValid: Bool = true
    @Published var isPasswordValid: Bool = true
    @Published var isUserLoggedIn: Bool = false
    @Published var showRegisterView: Bool = false
    
    @MainActor func login(userViewModel: UserViewModel) {
        DispatchQueue.main.async {
            self.isEmailValid = LoginDataValidator.validateEmail(email: self.email)
        }

        if !isEmailValid {
            return
        }
        
        Task {
            do {
                await userViewModel.login(email: email, password: password)
            }
        }

        DispatchQueue.main.async {
            self.isUserLoggedIn = userViewModel.isUserLoggedIn
            self.isPasswordValid = self.isUserLoggedIn
            print(userViewModel.isUserLoggedIn)
        }
    }

    @MainActor func enterAsGuest(userViewModel: UserViewModel) {
        userViewModel.setIsGuest(val: true)
    }
}
