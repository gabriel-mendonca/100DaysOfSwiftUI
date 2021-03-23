//
//  ContentView.swift
//  BetterRest
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 22/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    
    var body: some View {
        
        DatePicker("date", selection: $wakeUp).labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
