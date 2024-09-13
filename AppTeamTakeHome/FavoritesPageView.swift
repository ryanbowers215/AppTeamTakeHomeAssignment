//
//  FavoritesPageView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import SwiftUI

struct FavoritesPageView: View {
    @StateObject var router: Router
    @StateObject var cart: Cart
    @StateObject var favs: Favorites
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [Color.charc, Color.charc], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        Text("My Items").font(.title).foregroundColor(.text).bold().padding(.horizontal)
                        
                        Spacer()
                    }
                    ScrollView{
                        ForEach(favs.products) { prod in
                            
                            NavigationLink {
                                IndividualProductPageView(prod: prod, cart: cart, favs: favs)
                            } label: {
                                ProductListView(prod: prod, cart: cart, favs: favs)
                            }
                        }
                        
                    }
                }
                
                
                NavigationBarView(page: "Favorites", router: router)
            }
        }
    }
}

#Preview {
    FavoritesPageView(router: Router(), cart: Cart(), favs: Favorites())
}
