//
//  ContentView.swift
//  Animations
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 28/03/21.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwftUI")
    @State private var enable = false
    @State private var dragAmount = CGSize.zero
    @State private var dragAmountLetters = CGSize.zero
    @State private var isShowingRed = false
    
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Button("tap") {
                withAnimation {
                self.isShowingRed.toggle()
                }
            }
            if isShowingRed {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .transition(.pivot)
            }
            
            HStack {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enable ? Color.blue : Color.red)
                        .offset(dragAmountLetters)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
                .gesture(
                    DragGesture()
                        .onChanged {
                            self.dragAmountLetters = $0.translation
                        }
                        .onEnded { _ in
                            self.dragAmountLetters = .zero
                            self.enable.toggle()
                        }
                )
            }
            
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged {
                            self.dragAmount = $0.translation
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                            self.dragAmount = .zero
                            }
                        }
                )
            
        Button("tap me") {
            self.enable.toggle()
        }.frame(width: 100, height: 100)
        .background(enable ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enable ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount),anchor: anchor).clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
    .modifier (
        active: CornerRotateModifier(amount: -90, anchor: .topLeading),
        identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
    )
    }
}
