import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let p = Path()
        p.move(to: center)
        
        return p
    }
}
