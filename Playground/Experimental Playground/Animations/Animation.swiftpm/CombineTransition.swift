//
//  File 4.swift
//  My App
//
//  Created by Moritz Beyer on 15.02.22.
//

import SwiftUI

struct CombineTransit: View {
    @State private var showDetails = false

        var body: some View {
            VStack {
                Button("Press to show details") {
                    withAnimation {
                        showDetails.toggle()
                    }
                }

                if showDetails {
                    Text("Details go here.")
                         .transition(AnyTransition.opacity.combined(with: .slide))
                }
            }

        }
    }

struct CombineTransit_Previews: PreviewProvider {
    static var previews: some View {
        CombineTransit()
    }
}
