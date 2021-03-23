//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 21/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var possibleMove = ["Rock", "Paper", "Scissors"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var showingCorrectOrWrong = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow,Color.white,Color.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(.all)
        VStack(spacing: 100) {
            Text("Rock, Paper or Scissors?")
                .fontWeight(.black)
                .font(.title)
                .lineLimit(0)
            VStack(spacing: 30) {
                Text("choose your move?")
                    .fontWeight(.semibold)
                    .font(.title2)
                HStack(spacing: 20) {
                    ForEach(0..<3) { number in
                        Button(action: {
                            options(number)
                        }, label: {
                            Image(possibleMove[number]).renderingMode(.original)
                        }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                Text("Score: \(score)")
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                Button(action: {
                    score = 0
                }, label: {
                    Text("Reset Score")
                        .foregroundColor(.red)
                })
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.alert(isPresented: $showingCorrectOrWrong, content: {
            Alert(title: Text(scoreTitle), message: Text("you score is \(score)"), dismissButton: .default(Text("continue")){
                askQuestion()
            })
        })
    }
    
    func options(_ number: Int) {
        
        switch true {
        case possibleMove[correctAnswer] == "Rock" && possibleMove[number] == "Paper" || possibleMove[correctAnswer] == "Paper" && possibleMove[number] == "Scissors" || possibleMove[correctAnswer] == "Scissors" && possibleMove[number] == "Rock":
            scoreTitle = "You lost!"
            score -= 1
        case possibleMove[correctAnswer] == "Rock" && possibleMove[number] == "Scissors" || possibleMove[correctAnswer] == "Paper" && possibleMove[number] == "Rock" || possibleMove[correctAnswer] == "Scissors" && possibleMove[number] == "Paper" :
            scoreTitle = "You mon!"
            score += 1
        default:
            scoreTitle = "this is a tie"
        }
        showingCorrectOrWrong = true
    }
    
    func askQuestion() {
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
