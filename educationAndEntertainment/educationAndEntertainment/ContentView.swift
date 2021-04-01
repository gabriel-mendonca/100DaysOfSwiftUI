//
//  ContentView.swift
//  educationAndEntertainment
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 31/03/21.
//

import SwiftUI

struct Question: Hashable {
    let text: String
    let answer: String
    var correction: String
}

struct ContentView: View {
    
    @State private var multiplicationTable = 1
    @State private var numberQuestion = 0
    @State private var isActive = false
    @State private var question: [Question] = []
    @State private var answer: [String] = []
    
    
    
    var body: some View {
        NavigationView {
        Group {
            if !isActive {
            Form {
                Section(header: Text("Which number you want to practice?")){
                    Stepper("\(multiplicationTable)", value: $multiplicationTable, in: 1...12)
                }
                Section(header: Text("How many questions do you want to answer")) {
                    Stepper(value: $numberQuestion,in: 0...20,step: 5) {
                        Text("\(numberQuestion)")
                    }
            }
            }
            } else {
                if numberQuestion == 0 {
                    VStack(spacing: 10) {
                        Spacer()
                    Text("select the number of questions you want to answer!").lineLimit(2)
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 300, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        returns()
                    }, label: {
                        Text("Return")
                    }).frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
                List(0..<question.count) {
                    Text(question[$0].text).padding()
                    
                    TextField("Answer", text: $answer[$0])
                    
                    Text(question[$0].correction).padding()
                        .foregroundColor(question[$0].correction == "right" ? Color.green : Color.red)
                }
            }
        }
        .navigationTitle("Multiplication table")
        .navigationBarItems(leading: Button(action: returns) {
            Text(isActive ? "return" : "")
        },trailing: Button(action: isActive ? verificateAnswer : isActives){
            Text("Start")
        })
        }
    }
    
    func isActives() {
        isActive = true
        for _ in  0..<numberQuestion {
            let numberRandon = Int.random(in: 0...10)
            let answer = multiplicationTable * numberRandon
            let question = Question(text: "\(multiplicationTable) X \(numberRandon)", answer: String(Int(answer)), correction: "" )
            
            self.question.append(question)
            self.answer.append("")
            
        }
    }
    
    func verificateAnswer() {
        for (index,questions) in question.enumerated() {
            if questions.answer == answer[index] {
                question[index].correction = "right"
            } else {
                question[index].correction = "wrong"
            }
        }
    }
    
    func returns() {
        isActive = false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
