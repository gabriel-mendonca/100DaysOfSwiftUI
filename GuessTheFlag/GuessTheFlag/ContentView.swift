//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 16/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var punctuation = 0
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30)
            {        VStack {
                Text("Tap the flag of")
                    .foregroundColor(.white)
                Text(countries[correctAnswer])
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
            }
            ForEach(0..<3) { number in
                Button(action: {
                    self.flagTapped(number)
                }, label: {
                    Image(self.countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black,lineWidth: 1))
                        .shadow(color: .black, radius: 2)
                })
            }
            Text("Score: \(punctuation)")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
            Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("you score is \(punctuation)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct +100"
            punctuation += 100
        } else {
            scoreTitle = "wrong, this is the flag of \(countries[number]), -50"
            punctuation -= 50
        }
        showingScore = true
    }
    
    func askQuestion() {
        self.countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
