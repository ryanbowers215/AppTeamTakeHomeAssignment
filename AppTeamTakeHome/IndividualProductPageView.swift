//
//  IndividualProductPageView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import SwiftUI

struct IndividualProductPageView: View {
    @State var prod: SimpleProductWrapper
    @StateObject var cart: Cart
    @StateObject var favs: Favorites
    @State var liked: Bool = false
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [Color.charc, Color.charc], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack{
                
                HStack{
                    StarRatings(value: prod.prod.rating)
                    Text("(\(prod.prod.reviews.count))").font(.caption2).foregroundColor(.gray)
                    Spacer()
                }.padding(.horizontal, 25)
                
                ScrollView{
                    
                    AsyncImage(url: URL(string: prod.prod.thumbnail)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 350, height:350)
                    
                    Spacer()
                    
                    HStack{
                        Text("$\(String(format: "%.2f", prod.prod.price))").font(.title).bold().padding()
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack{
                        Text("In Stock").foregroundColor(.green)
                        Text("at").foregroundColor(.gray)
                        Text("Cupertino").underline()
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack{
                        Button {cart.addToCart(prod: prod)} label : {
                            ZStack{
                                Rectangle().foregroundColor(.blue).frame(width: 320, height: 40).cornerRadius(25.0)
                                Text("Add to Cart").foregroundColor(.white).font(.body)
                            }
                        }
                        
                        Button {favs.addToFavorites(prod: prod); liked.toggle()} label : {
                            
                            ZStack{
                                Circle().frame(width: 40, height: 40).foregroundColor(.darkgray)
                                Image(systemName: liked ? "heart.fill" : "heart").resizable().foregroundColor(.white).frame(width: 25, height: 22)
                            }
                        }.onAppear{
                            Task{
                                liked = prod.isLiked
                            }
                        }
                    }.padding()
                    
                    HStack{
                        Text("Description").font(.title3).bold()
                        Spacer()
                    }.padding()
                    
                    Text("\(prod.prod.description)").foregroundColor(.gray).font(.caption).bold().padding(.horizontal)
                    
                    HStack{
                        Text("Reviews").font(.title3).bold()
                        Spacer()
                    }.padding()
                    
                    
                    ForEach(prod.prod.reviews) { rev in
                        ReviewView(rev: rev)
                    }
                    
                    
                    
                }.padding()
             
                
            }.padding()
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("\(prod.prod.title)")
                    .foregroundColor(.text)
            }
        }
    }
}

#Preview{
    ContentView()
}

