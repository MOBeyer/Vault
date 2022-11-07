import SwiftUI

struct CustomLinearProgressViewStyle<Stroke: ShapeStyle, Background: ShapeStyle>: ProgressViewStyle {
    var stroke: Stroke
    var fill: Background
    var caption: String = ""
    var cornerRadius: CGFloat = 10
    var height: CGFloat = 20
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(fill)
                    .frame(height: height)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(stroke)
                    .frame(height: height)
                    .mask(
                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .frame(maxWidth: geo.size.width * CGFloat(fractionCompleted))
                        }
                    )
            }
            if !caption.isEmpty {
                Text("\(caption)")
                    .font(.caption)
            }
        }
    }
}


struct ContentView: View {
    @State private var value: CGFloat = 0.0
    @State private var inputState: String = ""
    
    var body: some View {
        let gradientStyle = CustomLinearProgressViewStyle(
            stroke: .purple,
            fill: Color.gray,
            caption: "Some fancy caption"
        )
        
        VStack(alignment: .leading) {
            ProgressView(value: value/100)
                .padding(.vertical)
                .progressViewStyle(gradientStyle)
            Slider(value: $value, in: 0...100, step: 1)
            Text("State: \(value, specifier: "%.0f") %")
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

