//
//  ProfileView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


import SwiftUI

struct ProfileView: View {
    @State private var qrCodeImage: UIImage?
    
    var body: some View {
        VStack {
            Text("Your Profile")
                .font(.largeTitle)
                .bold()
                .padding()
            
            if let qrCodeImage = qrCodeImage {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
            } else {
                Text("No QR code found.")
                    .padding()
            }
        }
        .onAppear {
            loadQRCodeFromDocuments()
        }
    }
    
    func loadQRCodeFromDocuments() {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsDirectory.appendingPathComponent("qrCode.png")
        
        if let imageData = try? Data(contentsOf: fileURL) {
            qrCodeImage = UIImage(data: imageData)
        }
    }
}

#Preview {
    ProfileView()
}
