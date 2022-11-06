import SwiftUI

final class Model: ObservableObject {
    @Published var counter: Int = 0
}

struct ContentView: View {
    @ObservedObject var model = Model()
    var body: some View {
        Button("\(model.counter)") {
            model.counter += 1
        }
    }
}
