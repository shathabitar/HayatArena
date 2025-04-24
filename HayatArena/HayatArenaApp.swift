//
//  HayatArenaApp.swift
//  HayatArena
//
//  Created by Shatha Bitar on 21/04/2025.
//

import SwiftUI
import FirebaseCore

@main
struct HayatArenaApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
<<<<<<< HEAD
            AuthRouter()
=======
            SignInPage()
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
        }
    }
}
