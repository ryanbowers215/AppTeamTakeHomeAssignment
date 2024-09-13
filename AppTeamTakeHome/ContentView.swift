//
//  ContentView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var router = Router()
    @StateObject var cart: Cart = Cart()
    @StateObject var favs: Favorites = Favorites()
    @StateObject var ViewModel = ProductViewModel()
    
    var body: some View {
        VStack{
            switch router.currentRoute {
                case .products:
                    ProductsPageView(router: router, ViewModel: ViewModel, cart: cart, favs: favs)
                case .favorites:
                    FavoritesPageView(router: router, cart: cart, favs: favs)
                case .cart:
                CartView(router: router, cart: cart, favs: favs)
            }
        }.onAppear {
            Task {
                await ViewModel.loadProducts()
            }
        }
    }
}

#Preview {
    ContentView()
}
