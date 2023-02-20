//
//  ContentView.swift
//  HUE ROTATION
//
//  Created by Иван Львов on 10.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var shiftColors = false
    @State private var image = "Juice"
    
    @State private var angle: Double = 360
    
    var body: some View {
        VStack {
            ZStack{
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                    
                Image(image)
                
                    .resizable()
                    .scaledToFit()
                    .hueRotation(Angle.degrees(shiftColors ? 360.0 : 0))
                    .animation(
                        Animation.easeInOut(duration: 2)
                            .delay(0.4)
                            .repeatForever(autoreverses: true),
                        value: shiftColors
                    )
                    .onAppear{
                        shiftColors.toggle()
                    }
            }
            
            HStack {
                ForEach(0..<6) {
                    Rectangle()
                        .fill(.linearGradient(
                            colors: [.blue, .red, .green],
                            startPoint: .top, endPoint: .bottom))
                        .hueRotation((.degrees( shiftColors ? Double($0 * 36) : 0)))
                        .animation(
                            Animation.easeInOut(duration: 2)
                                .delay(0.4)
                                .repeatForever(autoreverses: true),
                            value: shiftColors
                        )
                        .frame(width: 60, height: 60, alignment: .center)
                }
            }
            
            Text("\(angle)")
            Slider(value: $angle, in: 0...360)
                .padding(.horizontal, 50)
            
        }
    }
}


struct OffExample: View {
    var body: some View {
        HStack {
            ForEach(0..<6) {
                Rectangle()
                    .fill(.linearGradient(
                        colors: [.blue, .red, .green],
                        startPoint: .top, endPoint: .bottom))
                    .hueRotation((.degrees(Double($0 * 36))))
                    .frame(width: 60, height: 60, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("Your Example")
        OffExample()
            .previewDisplayName("Apple Example")
    }
}
