import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    
    @Published var isEmailValid: Bool = true
    @Published var isPasswordValid: Bool = true
    @Published var isRepeatedPasswordValid: Bool = true
    @Published var isUserRegistered: Bool = false
    @Published var triedToRegister: Bool = false
    @Published var isLoading: Bool = false

    let repeatedPasswordErrorInfo = "Passwords do not match"
    let accountAlreadyExistsErrorInfo = "Account with this email already exists"
        
    @MainActor func register(userViewModel: UserViewModel) {
        self.isEmailValid = LoginDataValidator.validateEmail(email: self.email)
        self.isPasswordValid = LoginDataValidator.validatePassword(password: self.password)
        self.isRepeatedPasswordValid = self.password == self.repeatedPassword
                
        if !isEmailValid || !isPasswordValid || !isRepeatedPasswordValid {
            triedToRegister = false
            return
        }
        self.isLoading = true
        Task {
            do {
                let loggedIn = await userViewModel.register(email: email, password: password)
                self.isUserRegistered = loggedIn
                self.triedToRegister = true
                self.isLoading = false
            }
        }
    }
}
