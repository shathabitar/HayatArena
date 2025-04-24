//
//  SignInPage 2.swift
//  HayatArena
//
//  Created by Shatha Bitar on 24/04/2025.
//


import SwiftUI
import Firebase
import FirebaseAuth
<<<<<<< HEAD
import SwiftUI
import FirebaseAuth

struct SignInPage: View {
    @Binding var isAuthenticated: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
=======


struct SignInPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isSignedIn = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In")
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
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

<<<<<<< HEAD
            Button(action: signUp) {
                Text("Sign Up")
=======
            Button(action: signIn) {
                Text("Sign In")
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
<<<<<<< HEAD
=======

            if isSignedIn {
                Text("✅ Signed In Successfully")
                    .foregroundColor(.green)
            }
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
        }
        .padding()
    }

<<<<<<< HEAD
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
=======
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = ""
<<<<<<< HEAD
                isAuthenticated = true  // Set authenticated status to true after sign up
=======
                isSignedIn = true
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
            }
        }
    }
}
<<<<<<< HEAD
=======


#Preview {
    SignInPage()
}
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
