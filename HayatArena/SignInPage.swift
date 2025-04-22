//
//  SignInPage.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct SignInPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isSignedIn = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button(action: signIn) {
                Text("Sign In")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if isSignedIn {
                Text("✅ Signed In Successfully")
                    .foregroundColor(.green)
            }
        }
        .padding()
    }

    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = ""
                isSignedIn = true
            }
        }
    }
}


#Preview {
    SignInPage()
}
