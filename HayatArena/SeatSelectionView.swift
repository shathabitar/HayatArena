import SwiftUI

struct SeatSelectionView: View {
    @State private var selectedSeat: String? = nil
    @State private var ticketDetails: Ticket? = nil
    @State private var isPaymentSuccessful: Bool = false

    // Generate more seats in a stadium-like format
    let seatRows: [String] = Array("ABCDEFGHIJ").map { String($0) }
    let seatNumbers = Array(1...12)
    var seats: [String] {
        seatRows.flatMap { row in seatNumbers.map { "\(row)\($0)" } }
    }

    var body: some View {
        VStack {
            Text("Select Your Seat")
                .font(.title)
                .bold()
                .padding(.top)

            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 12), spacing: 4) {
                    ForEach(seats, id: \.self) { seat in
                        Button(action: {
                            selectedSeat = seat
                            ticketDetails = Ticket(seat: seat, price: 100)  // Dummy price
                            isPaymentSuccessful = false
                        }) {
                            Text(seat)
                                .font(.caption2)
                                .frame(width: 30, height: 30)
                                .background(selectedSeat == seat ? Color.green : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(4)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }

            // Ticket and payment
            if let selectedSeat = selectedSeat, let ticket = ticketDetails {
                VStack(spacing: 8) {
                    Text("Selected Seat: \(selectedSeat)")
                    Text("Price: $\(ticket.price)")

                    Button("Pay") {
                        simulatePayment(ticket: ticket)
                    }
                    .buttonStyle(.borderedProminent)

                    if isPaymentSuccessful {
                        Text("Payment Successful!")
                            .foregroundColor(.green)
                        QRCodeView(ticket: ticket)
                    }
                }
                .padding()
            }
        }
        .padding()
    }

    func simulatePayment(ticket: Ticket) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isPaymentSuccessful = true
        }
    }
}

struct Ticket {
    var seat: String
    var price: Int
}


