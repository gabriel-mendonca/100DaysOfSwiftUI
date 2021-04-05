//
//  AddView.swift
//  iExpense
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 03/04/21.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showingError = false
    @Environment(\.presentationMode) var presentationMode
    
    static let types = ["Bussines", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name", text: $name)
                Picker("type", selection: $type) {
                    ForEach(Self.types,id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                showingError = true
                }
            }).alert(isPresented: $showingError, content: {
                Alert(title: Text("invalid amount"), message: Text("please, write only numbers in amount"), dismissButton: .default(Text("Ok")))
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
