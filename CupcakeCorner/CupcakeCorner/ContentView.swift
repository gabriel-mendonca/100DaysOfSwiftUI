//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 16/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0 ..< Order.types.count,id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper(value: $order.quantity, in: 0...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnable.animation(), label: {
                        Text("Any special requests?")
                    })
                    if order.specialRequestEnable {
                        Toggle(isOn: $order.extraFrosting, label: {
                            Text("Add extra frosting")
                        })
                        
                        Toggle(isOn: $order.addSprinkles, label: {
                            Text("Add extra sprinkles")
                        })
                    }
                }
                
                Section {
                    NavigationLink(
                        destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }.navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
