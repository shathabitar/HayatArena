//
//  MatchDetailView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


import SwiftUI

struct MatchDetailView: View {
    var match: String

    var body: some View {
        VStack(spacing: 20) {
            Text(match)
                .font(.title)
                .bold()

            NavigationLink("Book a Seat & Pay", destination: SeatSelectionView())

        }
        .padding()
        .navigationTitle("Match Details")
    }
}

#Preview{
    MatchDetailView(match: "123")
}
