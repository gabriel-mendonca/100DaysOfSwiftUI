//
//  ContentView.swift
//  WeConvert
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 15/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = ""
    @State private var second = 0
    @State private var hours = 0
    
    let times = ["second","minutes","hours"]
    let convert = ["second","minutes","hours"]
    
    var convertHours: Double {
        let selected = times[second]
        let converts = convert[hours]
        let amountValue = Double(value) ?? 0
        var finalValue: Double
        
        switch selected {
        case "second":
            if converts == "minutes" {
                finalValue = amountValue / 60
                return finalValue
            } else if converts == "hours" {
                finalValue = amountValue / 3600
                    return finalValue
            } else {
                return amountValue
            }
        case "minutes":
            if converts == "hours" {
                finalValue = amountValue / 60
                return finalValue
            } else if converts == "second" {
                finalValue = amountValue * 60
            } else {
                return amountValue
            }
        case "hours" :
            if converts == "minutes" {
            finalValue = amountValue * 60
                return finalValue
            } else if converts == "second" {
                finalValue = amountValue * 3600
                return finalValue
            } else {
                return amountValue
            }
        default:
            return amountValue
        }
        return finalValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert time")) {
                    TextField("value you want to convert", text: $value)
                    Picker("times", selection: $second) {
                        ForEach( 0..<times.count) {
                            Text("\(self.times[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Picker("", selection: $hours) {
                        ForEach(0..<convert.count) {
                            Text("\(self.convert[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("\(convertHours,specifier: "%.3f")")
                }
            }
            .navigationTitle("WeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
