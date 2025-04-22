//
//  LoginView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoading = false
    @State private var isLoggedIn = false
    @State private var path: [String] = []

    var body: some View {
        NavigationStack(path: $path) {
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
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
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
            }
            .padding()
            .navigationDestination(for: String.self) { value in
                if value == "home" {
                    MainTabView()
                }
            }
            .onChange(of: isLoggedIn) {
                if isLoggedIn {
                    path.append("home")
                    isLoggedIn = false // optional reset if needed
                }
            }
        }
    }

    func loginUser() {
        errorMessage = ""
        isLoading = true

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isLoggedIn = true
            }
        }
    }
}


#Preview {
    LoginView()
}
