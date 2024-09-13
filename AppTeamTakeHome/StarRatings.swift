//
//  StarRatings.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/13/24.
//

import SwiftUI

struct StarRatings: View {
    let value: Double
    var body: some View {
        
        HStack(spacing: 0){
            ForEach(0..<5) { index in
                Image(systemName: imageName(for: index, value: value))
            }
        }.foregroundColor(.stars)
  
             
    }
}
func imageName(for starIndex: Int, value: Double) -> String {
    if value >= Double(starIndex + 1) {
        return "star.fill"
    }
    else if value >= Double(starIndex) + 0.5 {
        return "star.leadinghalf.filled"
    }
    else {
        return "star"
    }
}
    
#Preview {
    StarRatings(value: 3.6)
}
