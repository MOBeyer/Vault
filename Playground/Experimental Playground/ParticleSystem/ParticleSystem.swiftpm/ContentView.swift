import SwiftUI

struct ContentView: View {
    @State private var particleSystem = ParticleSystem()
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let timelineDate = timeline.date.timeIntervalSinceReferenceDate
                particleSystem.update(date: timelineDate)
                
                context.blendMode = .plusLighter
                context.addFilter(.colorMultiply(.green))
                
                for particle in particleSystem.particles {
                    let xPos = particle.x * size.width
                    let yPos = particle.y * size.height
                    
                    
                    context.opacity = 1 - (timelineDate - particle.creationDate)
                    context.draw(particleSystem.image, at: CGPoint(x: xPos, y: yPos))
                    
                }
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { drag in
                    particleSystem.center.x = drag.location.x / UIScreen.main.bounds.width
                    particleSystem.center.y = drag.location.y / UIScreen.main.bounds.height
                }
        )
        .ignoresSafeArea()
        .background(.white)
    }
}
