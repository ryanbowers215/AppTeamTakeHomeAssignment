//
//  ProductListView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import SwiftUI

struct ProductListView: View {
    @State var prod: SimpleProductWrapper
    @State var liked: Bool = false
    @StateObject var cart: Cart
    @StateObject var favs: Favorites

    var body: some View {
        HStack{
            
            AsyncImage(url: URL(string: prod.prod.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height:120)
            
            VStack{
                HStack{
                    Text("\(prod.prod.title)").font(.title3).foregroundColor(.text)
                    Spacer()
                }
        
                HStack{
                    Text("$\(String(format: "%.2f", prod.prod.price))").bold().font(.title2).foregroundColor(.text)
                    Spacer()
                }
                HStack{
                    ZStack{
                        Rectangle().foregroundColor(.darkgray).frame(width: 110, height: 20)
                        Text("\(prod.prod.category)").font(.caption).foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Button {cart.addToCart(prod: prod)} label : {
                        ZStack{
                            Rectangle().foregroundColor(.blue).frame(width: 175, height: 40).cornerRadius(25.0)
                            Text("Add to Cart").font(.body).foregroundColor(.white)
                        }
                    }
                    
          
                    Button {favs.addToFavorites(prod: prod); liked.toggle()} label : {
                        ZStack{
                            Circle().frame(width: 40, height: 40).foregroundColor(.darkgray)
                            Image(systemName: liked ? "heart.fill" : "heart").resizable().frame(width: 20, height: 17).foregroundColor(.white)
                        }
                    }.onAppear{
                        Task{
                            liked = prod.isLiked
                        }
                    }
                    Spacer()
                }
            }
        
            
        }.frame(width: 380, height: 120).padding()
    }
}

#Preview {
    ContentView()
}
