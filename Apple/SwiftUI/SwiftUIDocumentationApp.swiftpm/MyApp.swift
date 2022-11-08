import SwiftUI

@main
struct MyApp: App {
    @StateObject private var library = Library()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(library)
        }
    }
}
