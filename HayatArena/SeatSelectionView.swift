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
    @State private var isPaymentSuccessful: Bool = false

    // Sample seat array
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
                        isPaymentSuccessful = false  // Reset payment status
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

            // If a seat is selected, show ticket details and the option to simulate payment
            if let selectedSeat = selectedSeat, let ticket = ticketDetails {
                Text("Selected Seat: \(selectedSeat)")
                    .padding()

                Text("Price: $\(ticket.price)")
                    .padding()

                Button("Simulate Payment") {
                    simulatePayment(ticket: ticket)
                }
                .buttonStyle(.borderedProminent)
                .padding()

                if isPaymentSuccessful {
                    Text("Payment Successful!")
                        .foregroundColor(.green)
                        .padding()
                    QRCodeView(ticket: ticket)
                        .padding()
                } else {
                    Text("Payment Failed!")
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
        .padding()
    }

    func simulatePayment(ticket: Ticket) {
        // Simulate payment processing (this can be a random result)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let success = Bool.random()  // Random success or failure
            isPaymentSuccessful = success
        }
    }
}

struct Ticket {
    var seat: String
    var price: Int
}


