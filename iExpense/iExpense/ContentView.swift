//
//  ContentView.swift
//  iExpense
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 02/04/21.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State private var user = User(firstName: "Gabriel", lastName: "Goncalves")
    @State private var number = [Int]()
    @State private var currentNumbers = 1
    @State private var tapCount = UserDefaults.standard.integer(forKey: "tap")
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
            
            Text("your name is \(user.firstName) \(user.lastName)")
            .padding()
            
            TextField("first name", text: $user.firstName).padding(10)
                .border(Color.black, width: 1)
            TextField("last name", text: $user.lastName).padding(10)
                .border(Color.black, width: 1)
            
            Button("tap count: \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(self.tapCount, forKey: "tap")
            }
            Button("add number") {
                addNumbers()
            }
            
            List {
                ForEach(number,id: \.self) {
                    Text("\($0)")
                }.onDelete(perform: removeRows)
            }
            
            Button("button sheet") {
                self.showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                SecondView(name: "@gabriel_dev_swiftui")
            }
            .frame(width: 250, height: 50)
            .border(Color.black, width: 1)
            .clipShape(RoundedRectangle(cornerRadius: 0.0))
            
            Button("Save user") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(self.user) {
                    UserDefaults.standard.set(data, forKey: "userData")
                }
                showingAlert = true
            }
            .frame(width: 250, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("success!"), message: Text("your data has been successfully saved"), dismissButton: .default(Text("Ok")))
            })
        }.navigationBarItems(leading: EditButton())
      }
    }
    
    func addNumbers() {
        let numbers = Int.random(in: 0...200)
        number.append(numbers)
    }
    func removeRows(at offSets: IndexSet) {
        number.remove(atOffsets: offSets)
    }
}

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    var body: some View {
        VStack(spacing: 20) {
        Text("hello, \(name)!")
            Button("dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
