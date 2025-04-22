//
//  TicketView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 24/04/2025.
//


import SwiftUI
import SceneKit


struct TicketView: View {
    var ticket: Ticket
    @State private var showARNavigation = false
    
    var body: some View {
        VStack {
            Text("Your Ticket")
                .font(.headline)
                .padding()

            Text("Seat: \(ticket.seat), Price: $\(ticket.price)")
                .padding()
            
            Button("View in AR Navigation") {
                showARNavigation.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .sheet(isPresented: $showARNavigation) {
                // Show the AR Navigation View
                ARNavigationView(seatPosition: SCNVector3(0, 0, -1)) // Example seat position
            }
        }
        .padding()
    }
}

#Preview {
    TicketView(ticket: Ticket(seat: "A1", price: 100))  // Example ticket
}
