import SwiftUI

struct LoginView: View {
    @ObservedObject
    var vm: LoginViewModel

    var body: some View {
        VStack {
            Text("StreamFinder")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 50)
                .padding(.bottom, 20)
            
            TextField("Email", text: $vm.email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)

            if !vm.isEmailValid {
                Text("Invalid email")
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }
            
            SecureField("Password", text: $vm.password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)

            if !vm.isPasswordValid {
                Text("Invalid password")
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }
            
            Button(action: {
                vm.login()
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5.0)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
            
            Button(action: {
                //open register view
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5.0)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
