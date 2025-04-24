import SwiftUI
import SceneKit
import FirebaseAuth

struct ProfileView: View {
    @State private var qrCodeImage: UIImage?
    @Environment(\.dismiss) var dismiss  // Use this if you want to dismiss this view on logout
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = true  // You can use this to track auth state

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Welcome to your Profile")
                    .font(.title)
                    .padding()

                HStack {
                    Text("🎉 Reward Points: 500")
                        .font(.title2)
                        .padding()

                    Spacer()

                    NavigationLink(destination: Text("Rewards Details View")) {
                        Text("View Rewards")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding()

                NavigationLink(destination: Text("Add Friends View")) {
                    Text("👫 Add Friends")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

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

                NavigationLink(destination: ARNavigationView(seatPosition: SCNVector3(0, 0, -1))) {
                    Text("Navigate to Your Seat")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                // 🔓 Logout Button
                Button(action: logoutUser) {
                    Text("Logout")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top, 30)
            }
            .navigationTitle("Profile")
            .padding()
            .onAppear {
                loadQRCodeFromDocuments()
            }
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

    func logoutUser() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false  // Update your app state to reflect logout
        } catch {
            print("Logout failed: \(error.localizedDescription)")
        }
    }
}
