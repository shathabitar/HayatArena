//
//  MatchDetailView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


import SwiftUI

<<<<<<< HEAD

=======
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
struct MatchDetailView: View {
    var match: Match
    
    var body: some View {
        VStack {
            Text(match.matchName)
                .font(.largeTitle)
                .bold()
                .padding()

<<<<<<< HEAD
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
=======
            NavigationLink("Book a Seat & Pay", destination: SeatSelectionView())

>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
        }
        .navigationTitle("تفاصيل المباراة")
        .padding()
        .navigationTitle("Match Details")
    }
}

<<<<<<< HEAD

//
//#Preview{
//    MatchDetailView(match: "123")
//}
=======
#Preview{
    MatchDetailView(match: "123")
}
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
