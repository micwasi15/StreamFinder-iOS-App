import SwiftUI

struct LoginFieldView: View {
    @Binding var text: String
    @Binding var isValid: Bool
    let title: String
    let errorMessage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            TextField("", text: $text)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(errorMessage == nil ? Color.clear : Color.red, lineWidth: 1)
                )
            
            if !isValid {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
            }
        }
    }
}

struct LoginFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFieldView(text: .constant(""), isValid: .constant(true), title: "Email", errorMessage: "Invalid email")
    }
}