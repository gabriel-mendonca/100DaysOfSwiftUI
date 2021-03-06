//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 20/03/21.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct CapsuleButton: View {
    @State private var useRedText = false
    var text: String
    
    var body: some View {
        Button(text) {
            self.useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .black)
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        GridStack(rows: 8, columns: 3) { row, col in
            CapsuleButton(text: "BT \(row * 3 + col)")
                .titleStyle()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
