//
//  ContentView.swift
//  Drawing
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 09/04/21.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var petalOffSet = -20.0
//    @State private var petalWidht = 100.0
    @State private var colorCycle = 0.0
    @State private var amount: CGFloat = 0.0
//    @State private var insetAmount: CGFloat = 0.0
//    @State private var rows = 4
//    @State private var columns = 4
    @State private var arrowAmount: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 20) {
        Arrow(insetAmount: arrowAmount)
            .strokeBorder(Color.green,lineWidth: arrowAmount)
            .frame(width: 300, height: 300)
            
            
            Button(action: {
                withAnimation(.linear(duration: 1)) {
                    self.arrowAmount = arrowAmount == 1 ? 25 : 1
                }
            }, label: {
                Text("Animate stroke border").foregroundColor(Color.green)
                    
            })

            Button("") {
                withAnimation(.linear(duration: 1)) {
                    self.arrowAmount = arrowAmount == 1 ? 20: 1
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
        
        /** below commented code for future studies on them */
        
//        Checkerboard(rows: rows, columns: columns)
//            .onTapGesture {
//                withAnimation(.linear(duration: 3)) {
//                    self.rows = 8
//                    self.columns = 16
//                }
//            }.edgesIgnoringSafeArea(.all)
        
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .onTapGesture {
//                withAnimation {
//                self.insetAmount = CGFloat.random(in: 10...90)
//                }
//            }
//        VStack {
//            VStack {
//                ZStack {
//                    Circle()
//                        .fill(Color(red: 1, green: 0, blue: 0))
//                        .frame(width: 200 * amount)
//                        .offset(x: -50, y: -80)
//                        .blendMode(.screen)
//
//                    Circle()
//                        .fill(Color(red: 0, green: 1, blue: 0))
//                        .frame(width: 200 * amount)
//                        .offset(x: 50, y: -80)
//                        .blendMode(.screen)
//
//                    Circle()
//                        .fill(Color(red: 0, green: 0, blue: 1))
//                        .frame(width: 200 * amount)
//                        .blendMode(.screen)
//                }
//                .frame(width: 300, height: 300)
//
//                Slider(value: $amount)
//                    .padding()
//            }
            
            
//            
//            ColorCyclingCircle(amount: colorCycle)
//                .frame(width: 300, height: 300)
//            Flower(petalOffSet: petalOffSet, petalWidht: petalWidht)
//                .fill(Color.red,style: FillStyle(eoFill: true))
////                .stroke(Color.red,lineWidth: 1)
//
//            Text("OffSet")
//            Slider(value: $petalOffSet, in: -40...40)
//                .padding([.horizontal,.bottom])
//
//            Text("widht")
//            Slider(value: $petalWidht, in: 0...100)
//                .padding(.horizontal)
//
//            Text("gradient")
//            Slider(value: $colorCycle)
//                .padding(.horizontal)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black)
//        .edgesIgnoringSafeArea(.all)
    }
}


struct Arrow: InsettableShape {
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX - 20, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + 20, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + 20, y: rect.midY))
        
        path.addLine(to: CGPoint(x: rect.midX + 75, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX - 75, y: rect.midY))
        
        path.addLine(to: CGPoint(x: rect.midX - 20, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - 20, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + 20, y: rect.maxY))
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
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
                Rectangle()
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
