//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 18/04/21.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    @State private var titleConfirmationMessage = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)

                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)

                    Button("Place Order") {
                        self.placeOlder()
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showingConfirmation, content: {
            Alert(title: Text(titleConfirmationMessage), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        })
        .navigationBarTitle("Check out", displayMode: .inline)
    }
    
    func placeOlder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                                self.titleConfirmationMessage = "Thank you!"
                                self.confirmationMessage = "your order for \(order.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            } else {
                self.titleConfirmationMessage = "Without network connection"
                self.confirmationMessage = "An error occurred while trying to connect to the internet, connect the device to the internet"
                print("Invalid response from server")
            }
            self.showingConfirmation = true
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
