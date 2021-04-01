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
    @State private var rotateAnimation = 0.0
    @State private var opacity = 1.0
    @State private var animationError = false
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
                Text("\(scoreTitle)")
                    .font(.headline)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.white)
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
                .animation(Animation.default.repeatCount(5, autoreverses: true))
                .opacity(number == self.correctAnswer ? 1 : opacity)
                .rotation3DEffect(
                    .degrees(number == self.correctAnswer ? rotateAnimation : 0),
                    axis:(x: 0.0, y: 1.0, z: 0.0))
            }
            Text("Score: \(punctuation)")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
            Spacer()
            
            Button("Continue") {
                self.askQuestion()
            }
            .frame(width: 250, height: 50)
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        opacity = 0.75
        if number == correctAnswer {
            scoreTitle = "Correct +100"
            punctuation += 100
            withAnimation(.easeOut) {
                rotateAnimation += 360
            }
        } else if punctuation == 0 {
            scoreTitle = "wrong,  That's \(countries[number])'s flag!"
        }else {
            scoreTitle = "wrong, this is the flag of \(countries[number]), -50"
            punctuation -= 50
            withAnimation(.easeOut) {
            animationError = true
            }
        }
    }
    
    func askQuestion() {
        self.countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        opacity = 1.0
        scoreTitle = " "
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
