import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    
    func login() {
        print("Login")
    }
    
    func register() {
        print("Register")
    }
}