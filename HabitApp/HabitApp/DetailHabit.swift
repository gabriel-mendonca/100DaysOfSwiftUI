//
//  DetailHabit.swift
//  HabitApp
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 14/04/21.
//

import SwiftUI

struct DetailHabit: View {
    @State var numberCount: ListForm
     var nameHabit: String
     var descriptionHabit: String
    @ObservedObject var habit: Items
    
    var body: some View {
        NavigationView {
                VStack(spacing: 20) {
            Text(nameHabit)
                .font(.largeTitle)
            Text(descriptionHabit)
                .font(.largeTitle)
                    Text("\(numberCount.number)")
                .font(.largeTitle)
                    Stepper("teste", value: self.$numberCount.number, in: 0...100) { _ in
                            saveHabit()
                         }
                    .frame(width: 100, height: 50)
                    Spacer()
                }.navigationTitle("Description habit")
        }
    }
    
    func saveHabit() {
        guard let index = habit.item.firstIndex(where: {$0.id == numberCount.id }) else { return }
        habit.item[index].number = numberCount.number
    }
}

//struct DetailHabit_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailHabit(numberCount: ListForm(name: "", type: "", number: 0), nameHabit: "", descriptionHabit: "")
//    }
//}
