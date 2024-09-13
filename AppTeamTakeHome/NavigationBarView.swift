//
//  NavigationBarView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import SwiftUI

struct NavigationBarView: View {
    @State public var page: String
    @StateObject var router: Router
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Rectangle().frame(width:393, height: 100).foregroundColor(.navbar)
                
                HStack{
                    Spacer()
                    Button {router.navigate(to: .products)} label : {
                        VStack{
                            Image(systemName:"carrot.fill").resizable().frame(width: 30, height: 30)
                            Text("Products").bold().font(.subheadline)
                        }.frame(width: 100).foregroundColor({page == "Products" ? .blue : .gray}())
                    }
                    Spacer()
                    Button(action: {
                        router.navigate(to: .favorites)
                    }) {
                        VStack {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 35, height: 30)
                            Text("My Items")
                                .bold()
                                .font(.subheadline)
                        }
                        .frame(width: 100)
                        .foregroundColor(page == "Favorites" ? .blue : .gray)
                    }
                    Spacer()
                    Button(action: {
                        router.navigate(to: .cart)
                    }) {
                        VStack {
                            Image(systemName: "cart.fill")
                                .resizable()
                                .frame(width: 35, height: 30)
                            Text("Cart")
                                .bold()
                                .font(.subheadline)
                        }
                        .frame(width: 100)
                        .foregroundColor(page == "Cart" ? .blue : .gray)
                    }
                    Spacer()
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    NavigationBarView(page: "Products", router: Router())
}
