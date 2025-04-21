//
//  MatchesView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


import SwiftUI

struct MatchesView: View {
    @State private var upcomingMatches = [
        "Team A vs Team B - Apr 25",
        "Team C vs Team D - Apr 28"
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(upcomingMatches, id: \.self) { match in
                    NavigationLink(destination: MatchDetailView(match: match)) {
                        Text(match)
                    }
                }
            }
            .navigationTitle("Upcoming Matches")
        }
    }
}

struct MatchDetailView: View {
    var match: String

    var body: some View {
        VStack(spacing: 20) {
            Text(match)
                .font(.title)
                .bold()

            Button("Book a Seat & Pay") {
                // Integrate payment here
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
