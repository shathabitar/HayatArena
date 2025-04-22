//
//  MapView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//

import SwiftUI
import MapKit

struct UserLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var people = [
        UserLocation(name: "Player 1", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        UserLocation(name: "Player 2", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
        UserLocation(name: "Player 3", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060))
    ]
    
    // Make sure region span is smaller for zooming
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Initial center
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Zoom level control
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: people) { person in
            MapAnnotation(coordinate: person.coordinate) {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.blue)
                    Text(person.name)
                        .font(.caption)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(4)
                }
            }
        }
        .navigationTitle("Map")
        .edgesIgnoringSafeArea(.all)
    }
}



#Preview {
    MapView()
}
