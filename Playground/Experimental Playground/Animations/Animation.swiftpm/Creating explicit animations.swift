//
//  File.swift
//  My App
//
//  Created by Moritz Beyer on 25.02.22.
//

import Foundation
import SwiftUI

struct CreatingExplicitAnimations: View {
    @State private var animationAmount = 0.0
    
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        
        .rotationEffect(.degrees(animationAmount))
    }
}

struct CreatingExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CreatingExplicitAnimations()
    }
}
