//
//  AuthRouter.swift
//  HayatArena
//
//  Created by Shatha Bitar on 24/04/2025.
//


import SwiftUI
import FirebaseAuth
struct AuthRouter: View {
    @State private var isAuthenticated = false

    var body: some View {
        NavigationStack {  // Add NavigationStack here
            VStack {
                if isAuthenticated {
                    MainTabView()  // Show tab view once authenticated
                } else {
                    SignInPage(isAuthenticated: $isAuthenticated)  // Show sign in page or login page
                }
            }
            .onAppear {
                checkAuthentication()
            }
        }
    }

    func checkAuthentication() {
        if Auth.auth().currentUser != nil {
            isAuthenticated = true  // User is already authenticated, show the tab view
        }
    }
}
