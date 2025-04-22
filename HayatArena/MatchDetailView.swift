//
//  MatchDetailView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


import SwiftUI


struct MatchDetailView: View {
    var match: Match
    
    var body: some View {
        VStack {
            Text(match.matchName)
                .font(.largeTitle)
                .bold()
                .padding()

            Image(match.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(12)
                .padding()

            Text("الملعب: \(match.stadium)")
                .font(.title3)
                .padding()
            
            NavigationLink("Book a Seat & Pay", destination: SeatSelectionView())

            Spacer()
        }
        .navigationTitle("تفاصيل المباراة")
        .padding()
    }
}


//
//#Preview{
//    MatchDetailView(match: "123")
//}
