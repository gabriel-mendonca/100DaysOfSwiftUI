//
//  AddHabit.swift
//  HabitApp
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 14/04/21.
//

import SwiftUI

struct AddHabit: View {
    @ObservedObject var habit = Items()
    @State private var name = ""
    @State private var descriptionItem = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("habit", text: $name)
                TextField("item description", text: $descriptionItem)
            }.navigationBarTitle("Add new Habit")
            .navigationBarItems(trailing: Button("Save", action: {
                let item = ListForm(name: self.name, type: self.descriptionItem, number: 0)
                self.habit.item.append(item)
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit()
    }
}
