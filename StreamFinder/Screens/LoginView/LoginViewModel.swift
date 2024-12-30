import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        print("Login")
    }
    
    func register() {
        print("Register")
    }
}