//
//  ContentView.swift
//  WordScramble
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 25/03/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        List {
            Section(header: Text("Section 1")) {
                ForEach(0..<3) {
                    Text("static row \($0)")
                }
            }
            Section(header: Text("Scetion 2")) {
                ForEach(0..<5) {
                    Text("Dinamic row \($0)")
                }
            }
            
            Section(header: Text("Section 3")) {
                Text("Static row 3")
                Text("Static row 4")
            }
        }.listStyle(GroupedListStyle())
        
                if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
                    if let fileContents = try? String(contentsOf: fileURL) {
                let input = """
                       a
                       b
                       c
                """
                let letters = input.components(separatedBy: "/n")
                let letter = letters.randomElement()
                let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
                let word = "swift"
                let checker = UITextChecker()
                let range = NSRange(location: 0, length: word.utf16.count)
                let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
                let allGood = misspelledRange.location == NSNotFound
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
