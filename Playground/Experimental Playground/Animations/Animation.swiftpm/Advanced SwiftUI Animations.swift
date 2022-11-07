//
//  File.swift
//  My App
//
//  Created by Moritz Beyer on 08.04.22.
//

import SwiftUI
struct SimpleCanvasView: View {
    var body: some View {
        Canvas { context, size in
            let rect = CGRect(origin: .zero, size: size).insetBy(dx: 25, dy: 25)

            // Path
            let path = Path(roundedRect: rect, cornerRadius: 35.0)

            // Gradient
            let gradient = Gradient(colors: [.green, .blue])
            let from = rect.origin
            let to = CGPoint(x: rect.width + from.x, y: rect.height + from.y)
            
            // Stroke path
            context.stroke(path, with: .color(.blue), lineWidth: 25)
            
            // Fill path
            context.fill(path, with: .linearGradient(gradient,
                                                     startPoint: from,
                                                     endPoint: to))
        }
    }
}

struct SimpleCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCanvasView()
    }
}

// Hello World
