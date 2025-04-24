//
//  MatchesView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 22/04/2025.
//


import SwiftUI
import SwiftUI

struct MatchesView: View {
    // Simulated upcoming matches with Arabic names and stadium info
    @State private var upcomingMatches = [
            Match(matchName: "البرازيل ضد الأرجنتين - 25 أبريل", stadium: "استاد ماراكانا, ريو دي جانيرو", imageName: "stadium1"),
            Match(matchName: "ألمانيا ضد إسبانيا - 28 أبريل", stadium: "استاد أليانز أرينا, ميونيخ", imageName: "stadium2"),
            Match(matchName: "فرنسا ضد إنجلترا - 1 مايو", stadium: "استاد فرنسا, باريس", imageName: "stadium3"),
            Match(matchName: "إيطاليا ضد هولندا - 5 مايو", stadium: "استاد سان سيرو, ميلانو", imageName: "stadium4"),
            Match(matchName: "البرتغال ضد بلجيكا - 10 مايو", stadium: "استاد دا لوز, لشبونة", imageName: "stadium5")
        ]
    
    var body: some View {
        NavigationStack {
            List(upcomingMatches, id: \.matchName) { match in
   
                NavigationLink(destination: MatchDetailView(match: match)) {
                    HStack {
                        Image(match.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                            .clipped()
                        
                        VStack(alignment: .leading) {
                            Text(match.matchName)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text("الملعب: \(match.stadium)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("المباريات القادمة")
        }
    }
}

struct Match {
    var matchName: String
    var stadium: String
    var imageName: String
}

#Preview {
    MatchesView()
}
