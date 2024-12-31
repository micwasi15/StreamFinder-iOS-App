import SwiftUI

struct LoginView: View {
    @StateObject
    var vm: LoginViewModel = LoginViewModel()
    
    @EnvironmentObject
    var userViewModel: UserViewModel

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
                Text(LoginDataValidator.emailErrorInfo)
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
                Text(LoginDataValidator.passwordErrorInfo)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }
            
            Button(action: {
                vm.login(userViewModel: userViewModel)
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
            
            
            NavigationLink(destination: RegisterView(vm: RegisterViewModel())){
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

            Button(action: {
                vm.enterAsGuest(userViewModel: userViewModel)
            }) {
                Text("Enter as Guest")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5.0)
                    .padding(.horizontal, 20)
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environmentObject(userViewModel)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        .environmentObject(UserViewModelPreview() as UserViewModel)
    }
}
