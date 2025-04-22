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
        UserLocation(name: "فهد العتيبي", coordinate: CLLocationCoordinate2D(latitude: 24.7743, longitude: 46.7386)),  // Fahd Al-Otaibi
            UserLocation(name: "سلمان الفهيد", coordinate: CLLocationCoordinate2D(latitude: 24.7743, longitude: 46.7386)),  // Salman Al-Fahied
            UserLocation(name: "نواف الجبرين", coordinate: CLLocationCoordinate2D(latitude: 24.7743, longitude: 46.7386)),  // Nawaf Al-Jubrin
            UserLocation(name: "عبدالله السحيمي", coordinate: CLLocationCoordinate2D(latitude: 24.7743, longitude: 46.7386)),  // Abdullah Al-Suhaimi
            UserLocation(name: "محمد القحطاني", coordinate: CLLocationCoordinate2D(latitude: 24.7743, longitude: 46.7386))   // Mohammed Al-Qahtani
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
