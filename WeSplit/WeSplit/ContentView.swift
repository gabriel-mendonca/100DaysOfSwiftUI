//
//  ContentView.swift
//  WeSplit
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 12/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        if numberOfPeople.count >= 1 {
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
        }
        return 0
    }
    
    var totalAmount: Double {
        let amount = Double(checkAmount) ?? 0
        let percentage = Double(tipPercentages[tipPercentage])
        
        let tipvalues = amount/100 * percentage
        let grandTotals = amount + tipvalues
        let amountPerCheck = grandTotals
        return amountPerCheck
    }
    
    let tipPercentages = [0,10,15,20,25]
    
    var body: some View {
        NavigationView {
        Form {
            
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("How many people?")) {
                TextField("Number of people", text: $numberOfPeople)
            }
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip Percentage", selection: $tipPercentage) {
                    ForEach( 0..<tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Amount per person")) {
                Text("$\(totalPerPerson,specifier: "%.2f")")
                }
            Section(header: Text("total amount")) {
                Text("$\(totalAmount,specifier: "%.2f")")
                    .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : nil)
            }
        }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

