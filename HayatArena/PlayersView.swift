//
//  PlayersView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//

import SwiftUI

<<<<<<< HEAD
// Player model
struct Player {
    let name: String
    let position: String
    let number: Int
    let image: String
}

// Players view with soccer field
=======
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
struct PlayersView: View {
    // List of Saudi Arabia team players
    let players = [
        Player(name: "Mohammed Al-Owais", position: "Goalkeeper", number: 1, image: "goalkeeper_image"),
        Player(name: "Yasser Al-Shahrani", position: "Defender", number: 2, image: "defender_image"),
        Player(name: "Ali Al-Bulaihi", position: "Defender", number: 4, image: "defender_image"),
        Player(name: "Salem Al-Dawsari", position: "Midfielder", number: 10, image: "midfielder_image"),
        Player(name: "Mohammed Kanno", position: "Midfielder", number: 7, image: "midfielder_image1"),
        Player(name: "Firas Al-Buraikan", position: "Forward", number: 9, image: "forward_image")
    ]
    
    @State private var selectedPlayer: Player?

    var body: some View {
        ScrollView{
            VStack {
                Text("Saudi Arabia Team - World Cup 2030⚽️")
                    .font(.title)
                    .bold()
                    .padding()

                ZStack {
                    // Soccer field layout (simple example)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green)
                        .frame(height: 300)
                        .overlay(
                            VStack {
                                
                                Spacer()
                            }
                        )
                    

                    VStack {
                        ForEach(players, id: \.name) { player in
                            Button(action: {
                                selectedPlayer = player
                            }) {
                                Text(player.name)
                                    .padding(6)
                                    .background(Color.white)
                                    .cornerRadius(8)
                            }
                            .padding(5)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                if let selectedPlayer = selectedPlayer {
                    PlayerDetailView(player: selectedPlayer)
                }
            }
            .navigationTitle("Players")
        }
        }
}

// View to show player details
struct PlayerDetailView: View {
    var player: Player

    var body: some View {
        VStack {
            Text(player.name)
                .font(.title)
                .bold()
            
            Text("Position: \(player.position)")
                .font(.subheadline)
                .padding()
            
            Text("Number: \(player.number)")
                .font(.subheadline)
            
            Image(player.image) // Use real player images here
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            Text("Player bio and statistics would go here.")
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

<<<<<<< HEAD
#Preview {
    PlayersView()
}
=======
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
