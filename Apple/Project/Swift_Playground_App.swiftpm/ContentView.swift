import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            Grid {
                Button("1") {
                    print("1")
                }
            }
        } else {
                // Fallback on earlier versions
        }
    }
}
