//
//  CartView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import SwiftUI

struct CartView: View {
    @StateObject var router: Router
    @State private var selection = "Pick Up"
    @StateObject var cart: Cart
    @StateObject var favs: Favorites
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.charc, Color.charc], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Text("Cart").font(.title).foregroundColor(.text).bold().padding(.horizontal)
                    
                    Spacer()
                }
                
                HStack{
                    Picker("Select a paint color", selection: $selection) {
                                   ForEach(["Pick Up", "Delivery"], id: \.self) {
                                       Text($0).foregroundColor(.text)
                                   }
                               }
                    .pickerStyle(.menu)
                    
                    
                    Text("from").foregroundColor(.gray)
                    Text("Cupertino").foregroundColor(.text).underline()
                    
                    Spacer()
                }
                
                ScrollView{
                    ForEach(cart.products) {
                        product in
                        NavigationLink {
                            IndividualProductPageView(prod: product, cart: cart, favs: favs)
                        } label: {
                            ItemInCartView(prod: product.prod)
                        }
                    }
                }
                
                VStack{
                    
                    CartTotalView(cart: cart)
                    ZStack{
                        Rectangle().foregroundColor(.blue).frame(width: 350, height: 40).cornerRadius(25.0)
                        Text("Check Out").foregroundColor(.white).font(.body)
                    }
                }.padding(.bottom, 70)
                
            }
            
            
            NavigationBarView(page: "Cart", router: router)
        }
    }
}

#Preview {
    ContentView()
}
