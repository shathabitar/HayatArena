//
//  SeatSelectionView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


import SwiftUI

struct SeatSelectionView: View {
    @State private var selectedSeat: String? = nil
    @State private var ticketDetails: Ticket? = nil

    // Sample seat array - in practice, you can fetch this from a backend or database
    let seats = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4"]

    var body: some View {
        VStack {
            Text("Select Your Seat")
                .font(.title)
                .bold()
                .padding()

            // Displaying seats in a grid
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 15) {
                ForEach(seats, id: \.self) { seat in
                    Button(action: {
                        selectedSeat = seat
                        ticketDetails = Ticket(seat: seat, price: 100)  // Dummy price
                    }) {
                        Text(seat)
                            .padding()
                            .background(selectedSeat == seat ? Color.green : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()

            // If a seat is selected, show ticket details and the option to pay
            if let selectedSeat = selectedSeat, let ticket = ticketDetails {
                Text("Selected Seat: \(selectedSeat)")
                    .padding()

                Text("Price: $\(ticket.price)")
                    .padding()

                Button("Proceed to Payment") {
                    // Navigate to payment or payment logic
                }
                .buttonStyle(.borderedProminent)
                .padding()

                // Generate QR Code for ticket
                QRCodeView(ticket: ticket)
                    .padding()
            }
        }
    }
}

struct Ticket {
    var seat: String
    var price: Int
}
