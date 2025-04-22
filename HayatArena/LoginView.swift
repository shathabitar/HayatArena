
import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @Binding var path: [AuthRoute]
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Welcome Back 👋")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button(action: loginUser) {
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                } else {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }

            HStack {
                Text("No account?")
                Button("Sign up") {
                    path.append(.signup)
                }
                .foregroundColor(.blue)
                .bold()
            }
        }
        .padding()
    }

    func loginUser() {
        errorMessage = ""
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                path.append(.home) // 👈 This is the key to go to HomeView
            }
        }
    }
}
