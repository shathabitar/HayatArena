import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                NavigationLink("🌍 View Map", destination: MapView())
                    .buttonStyle(.borderedProminent)

                NavigationLink("🧑‍🎤 Learn About Players", destination: PlayersView())
                    .buttonStyle(.borderedProminent)

                NavigationLink("🎟️ Book a Match", destination: BookMatchView())
                    .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Home")
            .padding()
        }
    }
}
