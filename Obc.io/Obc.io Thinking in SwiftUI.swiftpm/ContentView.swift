import SwiftUI

struct ContentView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// View Construction
struct ViewConstructionView: View {
    @State var counter = 0
    var body: some View {
        VStack {
            Button(action: { self.counter += 1 }, label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
            
            if counter > 0 {
                Text("Youve tapped \(counter) times")
            } else {
                Text("You`ve not tapped")
            }
        }
    }
}

struct ViewConstructionView_Previews: PreviewProvider {
    static var previews: some View {
        ViewConstructionView()
    }
}

// View Builders
struct ViewBuilderView: View {
    var body: some View {
        VStack {
            Text("Hello")
            if true {
                Image(systemName: "circle")
            }
            if false {
                Image(systemName: "square")
            } else {
                Divider()
            }
            Button(action: {}, label: {
                Text("Hi")
            })
        }
    }
}

struct ViewBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderView()
    }
}

// Compare to UIKit
// View Layout
// View Updates


// View Updates
// Updating the View Tree

// Dynamic View Tree

// Efficient View Trees

// State Property Attributes

// Property Wrappers

// State and Binding

// ObservedObject

// Other Dynamic View Properties


//MARK: Environment

//MARK: Using the Environment

//MARK: Depency Injection

//MARK: Preferences
struct PreferencesView: View {
    var body: some View {
        NavigationView {
            Text("Hello")
                .navigationBarTitle("Root View")
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}


//MARK: Layout

//MARK: Elementary Views
struct MeasureBehavior<Content: View>: View {
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    var content: Content
    
    var body: some View {
        VStack {
            content
                .border(Color.gray)
                .frame(width: width, height: height)
                .border(Color.black)
            Slider(value: $width, in: 0...500)
            Slider(value: $height, in: 0...200)
        }
    }
}

// Paths
struct PathsView: View {
    var body: some View {
        Path { p in
            p.move(to: CGPoint(x: 50, y: 0))
            p.addLines([
                CGPoint(x: 100, y: 75),
                CGPoint(x: 0, y: 75),
                CGPoint(x: 50, y: 0)
            ])
        }
    }
}

struct PathsView_Previews: PreviewProvider {
    static var previews: some View {
        PathsView()
    }
}

//Shapes
protocol Shape: Animatable, View {
    func path(in rect: CGRect) -> Path
}
/*
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { p in
            p.move(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLines([
                CGPoint(x: rect.maxX, y: rect.maxY),
                CGPoint(x: rect.minX, y: rect.maxX),
                CGPoint(x: rect.midX, y: rect.minY)
                       ])
            
        }
    }
}
*/

//MARK: Images
struct ImageView: View {
    let image = Image(systemName: "ellipsis")
    
    var body: some View {
        HStack {
            image
            image.resizable()
            image.resizable().aspectRatio( contentMode: .fit)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

//MARK: Text


//MARK: Layout Modifiers

// Frame

//MARK: Offset
struct OffsetView: View {
    var body: some View {
        HStack {
            Circle().fill(Color.red)
            Circle().fill(Color.blue).offset(y: 30)
            Circle().fill(Color.green)
        }
        .frame(width: 200, height: 60)
        .border(Color.black)
    }
}

struct OffsetView_Previews: PreviewProvider {
    static var previews: some View {
        OffsetView()
    }
}

// Padding
// Overlay and Background
/*
extension Overlay {
    func layout(in proposedSize: ProposedSize) -> CGSize {
        let backgroundSize = background.layou(proposedSize: proposedSize) _ = foreground.layout(proposedSize: proposedSize(width: backgroundSize(width: backgroundSize.width, height: backgroundSize.height)))
        return
    }
}
 */

struct OverlaysView: View {
    var body: some View {
        Text("Hello").background(
            Capsule()
                .stroke()
                .padding(5)
        )
    }
}

struct OverlaysView_Previews: PreviewProvider {
    static var previews: some View {
        OverlaysView()
    }
}







// Clipping and Masking
struct ClippingMaskingView: View {
    var body: some View {
        Rectangle()
            .rotation(.degrees(45))
            .fill(Color.red)
            .clipped()
            .frame(width: 100, height: 100)
    }
}
struct ClippingMaskingView_Previews: PreviewProvider {
    static var previews: some View {
        ClippingMaskingView()
    }
}


//MARK: Stack Views
struct StackViewsView: View {
    var body: some View {
        HStack {
            Text("Hello World")
            Rectangle().fill(Color.red).frame(minWidth: 200)
        }
    }
}
struct StackViewsView_Previews: PreviewProvider {
    static var previews: some View {
        StackViewsView()
    }
}


//MARK: Layout Priorities
/*
struct LayoutPrioritiesView: View {
    var body: some View {
        HStack(spacing: 0) {
            Text(longPath).truncationMode(.middle).lineLimit(1)
            Text("chapter1.md").layoutPriority(1)
        }
    }
}
struct LayoutPrioritiesView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPrioritiesView()
    }
}
*/

// Stack ALignment
