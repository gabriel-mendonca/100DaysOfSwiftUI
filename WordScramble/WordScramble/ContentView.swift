//
//  ContentView.swift
//  WordScramble
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 25/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var punctuation = 0
    @State private var maxScore = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                Text("Score: \(punctuation)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .navigationBarItems(leading: Button("New game", action: {
                startGame()
                usedWords.removeAll()
            }),trailing: Text("max. Score: \(maxScore)").font(.title3).fontWeight(.semibold))
            .alert(isPresented: $showingError, content: {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            })
        }
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWord = try? String(contentsOf: startWordsURL) {
                let allwords = startWord.components(separatedBy: "\n")
                rootWord = allwords.randomElement() ?? "silkworm"
                punctuation = 0
                newWord = ""
                return
        }
    }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {return}
        guard isOriginal(words: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word.")
            return
        }
        
        usedWords.insert(answer, at: 0)
        punctuation += 2
        maxScore += 2
        newWord = ""
    }
    
    func isOriginal(words: String) -> Bool {
        !usedWords.contains(words)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                if tempWord == word { return false }
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        if word.utf16.count < 3 { return false }
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
