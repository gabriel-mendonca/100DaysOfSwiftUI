//
//  ContentView.swift
//  BetterRest
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 22/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 0
    @State private var showingAlert = false
    
    let countCup = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    var body: some View {
        NavigationView {
            Form {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute )
                Section(header: Text("Desired amount of sleep")) {
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount,specifier: "%g") hours")
                }
                }
                Section(header: Text("daily coffe intake").font(.headline)) {
                Picker("Number of cup", selection: $coffeAmount) {
                    ForEach( 0..<countCup.count) {
                        Text("\(self.countCup[$0]) cups")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                }
                
                Text("Your ideal bedtime is \(correctHour)")
            }.navigationTitle("BetterRest")
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    
    var correctHour: String {
            calculateBedTime()
    }
    
    func calculateBedTime() -> String {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: sleepTime)
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
