import SwiftUI

class ParticleSystem {
    let image = Image("spark")
    var particles = Set<Particle>()
    var center = UnitPoint.center
    
    func update(date: TimeInterval) {
        let deathDate = date - 1
        
        for particle in particles {
            if particle.creationDate < deathDate {
                particles.remove(particle)
            }
        }
        let newParticle = Particle(x: center.x, y: center.y)
        particles.insert(newParticle)
    }
}

