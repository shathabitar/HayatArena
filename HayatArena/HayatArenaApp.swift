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
            AuthRouter()
        }
    }
}
