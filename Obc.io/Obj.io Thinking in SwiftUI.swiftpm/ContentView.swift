import SwiftUI
/*
struct ContentView: View {
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
                Text("Youve not yet tapped")
            }
        }.debug()
            .border(Color.black)
            .frame(width: 200, height: 200)
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}




// Takeaways
//
// SwiftUI views are values, not objects: they are immutable, transient descriptions of what should
//
// Almost all methods we call on a view (like frame or background) wrap the view in a modifier.
//
// Layouts proceed top down: parent views offer their abailable space to their children, which decide their size based on that
//
// We cant update whats onscreen directly. Instead, we have to modify state properties(e.g. @State or @ObservedObject) and let SwiftUI figure out how the view tree has changed
//

// View Updates

struct LabelView: View {
    let number: Int
    
    var body: some View {
        print("Label View")
        return Group {
            if number > 0 {
                Text("Youve tapped \(number) times")
            }
        }
    }
}

struct LabelViewContentView: View {
    @State var counter = 0
    
    var body: some View {
        print("ContentView")
        return VStack {
            Button("Tap me!") {self.counter += 1}
            
            // it is visible from the beginning as "Text?"
            // Relies on the elements in the view tree
            LabelView(number: counter)
        }
    }
}

struct LabelViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        LabelViewContentView()
    }
}

// BindingView

struct BindingLabelView: View {
    
    @Binding var number: Int
    
    var body: some View {
        print("LabelView")
        return Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            }
        }
    }
}
struct BindingContentView: View {
    @State var counter = 0
    
    var body: some View {
        print("ContentView")
        return VStack {
            //                  generic identifier
            Button("Tap me!") { self.counter += 1 }
            LabelView(number: counter)
        }
    }
}

// Dynamic View Trees

// if/else conditions in view builders
// ForEach
// AnyView

struct ForEachView: View {
    var body: some View {
        
        //             generic identifier
        ForEach(1...3, id: \.self) { x in
            Text("Item \(x)")
        }
    }
}

struct ForEachView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachView()
    }
}

// Efficient View Trees

struct EfficientViewTree: View {
    @Binding var counter: Int
    
    var body: some View {
        
        Group {
            if counter > 0 {
                Text("Youve tapped \(counter) times")
            }
        }
    }
}

struct EfficientViewTree_Previews: PreviewProvider {
    static var previews: some View {
        EfficientViewTree(counter: .constant(20))
    }
}

struct AnyViewContentView: View {
    @Binding var counter: Int
    
    var body: some View {
        if counter > 0 {
            return AnyView(Text("Youre tapped \(counter) times"))
        } else {
            return AnyView(Image(systemName: "lightbulb"))
        }
    }
}

struct AnyViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewContentView(counter: .constant(20))
    }
}
 */
