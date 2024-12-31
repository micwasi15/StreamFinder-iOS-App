import SwiftUI

class LoginDataValidator {
    static let emailErrorInfo = "Invalid email"
    static let passwordErrorInfo = "Password must be between 6 and 20 characters"

    static func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func validatePassword(password: String) -> Bool {
        return password.count >= 6 && password.count <= 20
    }
}
