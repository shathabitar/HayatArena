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
    @State private var qrCodeImage: UIImage?
    
    var body: some View {
        VStack {
            Text("Your Ticket")
                .font(.headline)
                .padding()

            if let qrCodeImage = qrCodeImage {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
            }
            
            Button("Save QR Code") {
                if let qrImage = generateQRCode(from: "Seat: \(ticket.seat), Price: $\(ticket.price)") {
                    saveQRCodeToDocuments(image: qrImage)
                }
            }
            .padding()
        }
        .onAppear {
            if let qrImage = generateQRCode(from: "Seat: \(ticket.seat), Price: $\(ticket.price)") {
                qrCodeImage = qrImage
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
    
    func saveQRCodeToDocuments(image: UIImage) {
        // Convert the image to PNG data
        if let imageData = image.pngData() {
            // Get the file URL to save the image
            let fileManager = FileManager.default
            let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsDirectory.appendingPathComponent("qrCode.png")
            
            // Save the image data to the file
            do {
                try imageData.write(to: fileURL)
                print("QR code saved at: \(fileURL)")
            } catch {
                print("Error saving QR code: \(error)")
            }
        }
    }
}
