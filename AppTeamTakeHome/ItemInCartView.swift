//
//  ItemInCartView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import SwiftUI

struct ItemInCartView: View {
    @State var prod: SimpleProduct
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: prod.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height:50)
            
            HStack{
                Text("\(prod.title)").foregroundColor(.text).font(.title2)
            }.frame(width: 200, height: 50)
            
            Spacer()
            
            Text("$\(String(format: "%.2f", prod.price))").bold().font(.title2).foregroundColor(.text)
            
        }.frame(width: 380, height: 50)
    }
}

