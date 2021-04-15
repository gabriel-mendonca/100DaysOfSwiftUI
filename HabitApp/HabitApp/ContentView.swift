//
//  ContentView.swift
//  HabitApp
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 14/04/21.
//

import SwiftUI

struct ListForm: Identifiable,Codable {
    var id = UUID()
    let name: String
    let type: String
    var number: Int
}

class Items: ObservableObject {
    @Published var item = [ListForm]()
}

struct ContentView: View {
    
    @ObservedObject var habit = Items()
    @State private var showingAlertSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habit.item) { item in
                    NavigationLink(destination: DetailHabit(numberCount: item, nameHabit: item.name, descriptionHabit: item.type, habit: self.habit) ) {
                        HStack {
                    Text(item.name)
                            Spacer()
                            Text(String(item.number))
                        }
                    }
                }.onDelete(perform: { indexSet in
                    removeItems(at: indexSet)
                })
            }.navigationBarTitle("Habit")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                showingAlertSheet = true
            }, label: {
                Image(systemName: "plus")
            }))
        }.sheet(isPresented: $showingAlertSheet, content: {
            AddHabit(habit: self.habit)
        })
    }
    
    func removeItems(at offSets: IndexSet) {
        habit.item.remove(atOffsets: offSets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
