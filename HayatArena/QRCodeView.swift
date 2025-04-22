//
//  QRCodeView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    var ticket: Ticket

    var body: some View {
        VStack {
            Text("Your Ticket")
                .font(.headline)
                .padding()

            if let qrCodeImage = generateQRCode(from: "Seat: \(ticket.seat), Price: $\(ticket.price)") {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
            }
        }
    }

    func generateQRCode(from string: String) -> UIImage? {
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(string.utf8)

        guard let outputImage = filter.outputImage else {
            return nil
        }

        let context = CIContext()
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }
        return nil
    }
}
