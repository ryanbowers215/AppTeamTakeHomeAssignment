//
//  ReviewView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/13/24.
//

import SwiftUI

struct ReviewView: View {
    @State var rev: Review
    var body: some View {
        VStack{
            HStack{
                Text("\(rev.reviewerName)").bold().foregroundColor(.text)
                Spacer()
                Text("\(rev.date.prefix(10))").foregroundColor(.gray)
            }
            
            HStack{
                StarRatings(value: rev.rating)
                Spacer()
            }
            HStack{
                Text("\(rev.comment)").foregroundColor(.gray)
                Spacer()
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
