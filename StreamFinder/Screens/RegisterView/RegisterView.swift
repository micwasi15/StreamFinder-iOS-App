import SwiftUI

struct RegisterView: View {
    @StateObject 
    var vm: RegisterViewModel = RegisterViewModel()
    
    @EnvironmentObject
    var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            if vm.isLoading {
                LoadingScreenView(text: "Registering...")
            } else {
                VStack (alignment: .leading, spacing: 20) {
                    Text("Register")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 50)
                        .padding(.bottom, 40)
                    
                    LoginFieldView(
                        text: $vm.email,
                        isValid: $vm.isEmailValid,
                        title: "Email",
                        errorMessage: LoginDataValidator.emailErrorInfo,
                        isSecure: false
                    )
                    
                    if vm.triedToRegister && !vm.isUserRegistered {
                        Text(vm.accountAlreadyExistsErrorInfo)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                    }
                    
                    LoginFieldView(
                        text: $vm.password,
                        isValid: $vm.isPasswordValid,
                        title: "Password",
                        errorMessage: LoginDataValidator.invalidPasswordErrorInfo,
                        isSecure: true
                    )
                    
                    LoginFieldView(
                        text: $vm.repeatedPassword,
                        isValid: $vm.isRepeatedPasswordValid,
                        title: "Repeat password",
                        errorMessage: vm.repeatedPasswordErrorInfo,
                        isSecure: true
                    )
                    .padding(.bottom, 80)
                    
                    Button(action: {
                        vm.register(userViewModel: userViewModel)
                    }) {
                        SimpleButtonView(text: "Register", bgColor: .blue)
                            .padding(.top, 20)
                    }
                }
                .padding(.horizontal, 40)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Constants.bgColor)
                .foregroundStyle(Constants.fgColor)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserViewModelPreview() as UserViewModel)
    }
}
