//
//  ContentView.swift
//  Drawing
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 09/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var petalOffSet = -20.0
    @State private var petalWidht = 100.0
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
//            
//            ColorCyclingCircle(amount: colorCycle)
//                .frame(width: 300, height: 300)
            Flower(petalOffSet: petalOffSet, petalWidht: petalWidht)
                .fill(Color.red,style: FillStyle(eoFill: true))
//                .stroke(Color.red,lineWidth: 1)

            Text("OffSet")
            Slider(value: $petalOffSet, in: -40...40)
                .padding([.horizontal,.bottom])

            Text("widht")
            Slider(value: $petalWidht, in: 0...100)
                .padding(.horizontal)
            
//            Text("gradient")
//            Slider(value: $colorCycle)
//                .padding(.horizontal)
        }
    }
}
    
    struct Flower: Shape {
        var petalOffSet: Double = 20
        var petalWidht: Double = 100
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
                let rotation = CGAffineTransform(rotationAngle: number)
                let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
                let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffSet), y: 0, width: CGFloat(petalWidht), height: rect.width / 2))
                let rotatedPetal = originalPetal.applying(position)
                path.addPath(rotatedPetal)
            }
            return path
        }
    }

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }.drawingGroup()
    }
        func color(for value: Int,brightness: Double) -> Color {
            var targetHue = Double(value) / Double(self.steps) + self.amount
            
            if targetHue > 1 {
                targetHue -= 1
            }
            return Color(hue: targetHue, saturation: 1, brightness: brightness)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
