//
//  File.swift
//  My App
//
//  Created by Moritz Beyer on 15.02.22.
//

import SwiftUI

struct ContentView2: View {
    @State private var animationAmount = 1.0
    var body: some View {
        VStack {
            Button("Test") {
                animationAmount += 1
            }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
            
            // overlay before animation
            
                .overlay(
                    Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                )
            
                .animation(
                    .easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: false),
                    value: animationAmount
                )
            
                .blur(radius: (animationAmount - 10) * 3)
            
                .onAppear {
                    animationAmount = 2
                }
        }
    }
}


struct ContentViewIII_Previews: PreviewProvider {
    static var previews: some View {
        ControllingTheAnimationStack()
    }
}


struct ControllingTheAnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .background(enabled ? .blue : .red)
        
        .frame(width: 200, height: 200)
        .foregroundColor(.white)
        .animation(.default, value: enabled)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.default, value: enabled)
    }
}
