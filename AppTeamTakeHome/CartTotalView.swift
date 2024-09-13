//
//  CartTotalView.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/13/24.
//

import SwiftUI

struct CartTotalView: View {
    @State var big: Bool = false
    @State var cart: Cart
    var body: some View {
        
        if !big {
            ZStack{
                Rectangle().foregroundColor(.darkgray).frame(width: 350, height: 100).cornerRadius(10.0)
                
                VStack(spacing: 0){
                    HStack{
                        Text("$\(String(format: "%.2f", cart.total)) total").bold().font(.title3)
                        Spacer()
                        Button{big.toggle()} label : {
                            Image(systemName: "chevron.up").foregroundColor(.white)
                        }
                    }.padding()
                    
                    HStack{
                        Text("\(cart.products.count) Items").font(.caption)
                        Spacer()
                    }.padding()
                }.frame(width: 350, height: 100).foregroundColor(.white)
            }.frame(width: 350, height: 100)
        } else {
            ZStack{
                Rectangle().foregroundColor(.darkgray).frame(width: 350, height: 180).cornerRadius(10.0)
                
                VStack(){
                    HStack{
                        Text("$\(String(format: "%.2f", cart.total)) total").bold().font(.title3)
                        Spacer()
                        Button{big.toggle()} label : {
                            Image(systemName: "chevron.down").foregroundColor(.white)
                        }
                    }.padding(3)
                    
                    HStack{
                        Text("\(cart.products.count)  Items").font(.caption)
                        Spacer()
                    }.padding(3)
                    
                    HStack{
                        Text("Subtotal").font(.caption)
                        Spacer()
                        Text("$\(String(format: "%.2f", cart.subtotal))").font(.caption)
                    }.padding(3)
                    HStack{
                        Text("Savings").font(.caption)
                        Spacer()
                        Text("$\(String(format: "%.2f", cart.savings))").font(.caption)
                    }.padding(3)
                    HStack{
                        Text("Taxes").font(.caption)
                        Spacer()
                        Text("$\(String(format: "%.2f", 0.07 * cart.subtotal))").font(.caption)
                    }.padding(3)
                    
                    
                    
                    
                }.frame(width: 350, height: 180).foregroundColor(.white)
                
                
            }.frame(width: 350, height: 180)
            
        }
    }
}

#Preview {
    ContentView()
}
