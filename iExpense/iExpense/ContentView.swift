//
//  ContentView.swift
//  iExpense
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 02/04/21.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var colorAmount = ""
    @State private var showingAddExpense = false
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)").foregroundColor(itemsAmount(items: item))
                    }
                }.onDelete(perform: { indexSet in
                    removeItems(at: indexSet)
                })
            }.navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(),trailing: Button(action: {
                showingAddExpense = true
            }, label: {
                Image(systemName: "plus")
            }))
        }.sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems(at offSets: IndexSet) {
        expenses.items.remove(atOffsets: offSets)
    }
    
    func itemsAmount(items: ExpenseItem) -> Color {
        if items.amount <= 10 {
               return Color.green
            } else if items.amount > 10 && items.amount <= 100 {
               return Color.blue
            } else {
               return Color.red
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
