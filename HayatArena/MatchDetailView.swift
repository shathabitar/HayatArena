//
//  MatchDetailView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


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