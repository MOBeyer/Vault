//
//  File.swift
//  My App
//
//  Created by Moritz Beyer on 25.02.22.
//

import Foundation
import SwiftUI

struct ShowingAndHidingViewsWithTransition: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ShowingAndHidingViewsWithTransition_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidingViewsWithTransition()
    }
}
