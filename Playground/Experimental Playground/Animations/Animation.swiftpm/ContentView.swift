import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
                
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            
            //is the order of modifiers important?
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
        }
    }
}

struct ContentViewII_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
