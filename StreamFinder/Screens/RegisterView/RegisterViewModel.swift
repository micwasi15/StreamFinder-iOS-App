import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var isRepeatedPasswordValid: Bool = false
    @Published var isUserRegistered: Bool = false
    @Published var triedToRegister: Bool = false

    let repeatedPasswordErrorInfo = "Passwords do not match"
    let accountAlreadyExistsErrorInfo = "Account with this email already exists"
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    func register() {
        isEmailValid = LoginDataValidator.validateEmail(email: email)
        isPasswordValid = LoginDataValidator.validatePassword(password: password)
        isRepeatedPasswordValid = password == repeatedPassword
        
        if !isEmailValid || !isPasswordValid || !isRepeatedPasswordValid {
            triedToRegister = false
            return
        }
        Task {
            do {
                await userViewModel.register(email: email, password: password)
            }
        }
        triedToRegister = true
        
        isUserRegistered = userViewModel.isUserLoggedIn
    }
}
