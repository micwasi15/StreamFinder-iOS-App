import SwiftUI

struct LoginFieldView: View {
    @Binding var text: String
    @Binding var isValid: Bool
    let title: String
    let errorMessage: String
    let isSecure: Bool 
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(Constants.fgColor)
            
            if isSecure {
                SecureField("", text: $text)
                    .accessibilityIdentifier("passwordTextField")
                    .textContentType(.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .foregroundStyle(.black)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isValid ? Color.clear : Color.red, lineWidth: 1)
                    )
            } else {
                TextField("", text: $text)
                    .accessibilityIdentifier("emailTextField")
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(Color(.systemGray6))
                    .foregroundStyle(.black)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isValid ? Color.clear : Color.red, lineWidth: 1)
                    )
            }
            
            if !isValid {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
                    .accessibilityIdentifier("loginErrorLabel")
            }
        }
    }
}

struct LoginFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFieldView(text: .constant(""), isValid: .constant(true), title: "Email", errorMessage: "Invalid email", isSecure: false)
            .background(.black)
    }
}
