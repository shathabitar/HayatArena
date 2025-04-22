//
//  HomeView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 24) {
            NavigationLink("🌍 View Map", destination: MapView())
                .buttonStyle(.borderedProminent)

            NavigationLink("🧑‍🎤 Learn About Players", destination: PlayersView())
                .buttonStyle(.borderedProminent)

            NavigationLink("🎟️ Book a Match", destination: MatchesView())
                .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Home")
        .padding()
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
