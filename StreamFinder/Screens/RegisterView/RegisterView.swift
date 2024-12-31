import SwiftUI

struct RegisterView: View {
    @StateObject 
    var vm = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $vm.email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)

                if !vm.isEmailValid {
                    Text(LoginDataValidator.emailErrorInfo)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }

                if vm.triedToRegister && !vm.isUserRegistered {
                    Text(vm.accountAlreadyExistsErrorInfo)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
                SecureField("Password", text: $vm.password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)

                if !vm.isPasswordValid {
                    Text(LoginDataValidator.passwordErrorInfo)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
                SecureField("Repeat password", text: $vm.repeatedPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)

                if !vm.isRepeatedPasswordValid {
                    Text(vm.repeatedPasswordErrorInfo)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
                Button(action: {
                    vm.register()
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
            }
            .padding()
            .navigationTitle("Register")
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
