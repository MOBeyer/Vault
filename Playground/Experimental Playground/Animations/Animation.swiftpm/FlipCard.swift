//
//  File 6.swift
//  My App
//
//  Created by Moritz Beyer on 15.02.22.
//

import SwiftUI

struct ContentView10: View {
    var body: some View {
        Flashcard(front: {
            Text("Front")
        }, back: {
            Text("Back")
        })
    }
}

struct Flashcard<Front, Back>: View where Front: View, Back: View {
    
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back) {
        self.front = front
        self.back = back
    }
    
    var body: some View {
        ZStack {
            if flipped {
                back()
            } else {
                front()
            }
        }
        
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .padding()
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
        )
        .padding()
        .onTapGesture {
            flipFlashcard()
        }
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
    }
    
    func flipFlashcard() {
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            flashcardRotation += 180
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation += 180
            flipped.toggle()
        }
    }
}
