import SwiftUI

struct LoginView: View {
    @StateObject
    var vm: LoginViewModel = LoginViewModel()
    
    @EnvironmentObject
    var userViewModel: UserViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Text("StreamFinder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 50)
                    .padding(.bottom, 40)

                LoginFieldView(
                    text: $vm.email,
                    isValid: $vm.isEmailValid,
                    title: "Email",
                    errorMessage: LoginDataValidator.emailErrorInfo,
                    isSecure: false
                )
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                
                LoginFieldView(
                    text: $vm.password,
                    isValid: $vm.isPasswordValid,
                    title: "Password",
                    errorMessage: LoginDataValidator.invalidPasswordErrorInfo,
                    isSecure: true
                )
                .padding(.bottom, 40)
                .padding(.horizontal, 20)
                
                VStack(spacing: 20) {
                    Button(action: {
                        vm.login(userViewModel: userViewModel)
                    }) {
                        SimpleButtonView(text: "Login", bgColor: .blue)
                    }
                    
                    Button(action: {
                        vm.showRegisterView = true
                    }) {
                        SimpleButtonView(text: "Register", bgColor: .blue)
                    }
                    
                    Button(action: {
                        vm.enterAsGuest(userViewModel: userViewModel)
                    }) {
                        SimpleButtonView(text: "Enter as guest", bgColor: Color(white: 0.35))
                    }
                    
                }
                .navigationDestination(isPresented: $vm.showRegisterView) {
                    RegisterView()
                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Constants.bgColor)
            .foregroundStyle(Constants.fgColor)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserViewModelPreview() as UserViewModel)
    }
}
