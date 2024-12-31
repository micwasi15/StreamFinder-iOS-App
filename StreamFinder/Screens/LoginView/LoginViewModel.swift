import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var isUserLoggedIn: Bool = false

    @EnvironmentObject var userViewModel: UserViewModel
    
    func login() {
        isEmailValid = LoginDataValidator.validateEmail(email: email)
        isPasswordValid = LoginDataValidator.validatePassword(password: password)

        if !isEmailValid || !isPasswordValid {
            return
        }

        userViewModel.login(email: email, password: password)

        isUserLoggedIn = userViewModel.isUserLoggedIn
    }
}