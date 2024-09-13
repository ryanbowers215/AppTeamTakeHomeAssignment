//
//  ProductsPageView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import SwiftUI

struct ProductsPageView: View {
    @StateObject var router: Router
    @StateObject var ViewModel: ProductViewModel
    @StateObject var cart: Cart
    @StateObject var favs: Favorites
    @State var displaySearch: Bool = false
  
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [Color.charc, Color.charc], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack{
                    
                    TextField("What are you looking for?", text: $ViewModel.searchQuery).padding(.horizontal, 25).onSubmit {
                        Task {await ViewModel.search()}
                        if ViewModel.searchQuery != "" {
                            displaySearch = true
                        } else {
                            displaySearch = false
                        }
                    }
                    
                    if displaySearch == true {
                        HStack{
                            Text("\(ViewModel.total) results for **\(ViewModel.searchQuery)**")
                            Spacer()
                        }.padding(.horizontal, 25)}
                    
                    
                
                    ScrollView{
                        ForEach(ViewModel.products) {
                            product in
                            NavigationLink {
                                IndividualProductPageView(prod: product, cart: cart, favs: favs)
                            } label: {
                                ProductListView(prod: product, cart: cart, favs: favs)
                            }
                        }
                        
                    
                    }.padding(.bottom, 70)
                }
                
                
                NavigationBarView(page: "Products", router: router)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
