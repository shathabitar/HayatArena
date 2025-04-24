import SwiftUI

struct SeatSelectionView: View {
    @State private var selectedSeat: String? = nil
    @State private var ticketDetails: Ticket? = nil
    @State private var isPaymentSuccessful: Bool = false

<<<<<<< HEAD
    // Generate more seats in a stadium-like format
    let seatRows: [String] = Array("ABCDEFGHIJ").map { String($0) }
    let seatNumbers = Array(1...12)
    var seats: [String] {
        seatRows.flatMap { row in seatNumbers.map { "\(row)\($0)" } }
    }
=======
    // Sample seat array
    let seats = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4"]
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9

    var body: some View {
        VStack {
            Text("Select Your Seat")
                .font(.title)
                .bold()
                .padding(.top)

<<<<<<< HEAD
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
=======
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
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
                    }
                }
<<<<<<< HEAD
                .padding()
=======
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
>>>>>>> ae4816f33eb111e2f9714b0351040d4cf486eda9
            }

            // Ticket and payment
            if let selectedSeat = selectedSeat, let ticket = ticketDetails {
                VStack(spacing: 8) {
                    Text("Selected Seat: \(selectedSeat)")
                    Text("Price: \(ticket.price) ")

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


