import SwiftUI
// MARK: Managing model data in your app https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app

struct ContentView: View {
    @State private var option = "Option1"
    var options = ["Option1", "Option2", "Option3"]

    var body: some View {
        VStack {
            Picker("Options", selection: $option) {
                ForEach(options, id: \.self) {
                    Text($0)
                }
            }
            LibraryView()
            LibraryView()
        }
    }
}

class Book: ObservableObject {
    @Published var title = "Great Expectations"

    let identifier = UUID()  // A unique identifier that never changes
}

class Library: Book {
    @Published var book = ["Book1", "Book2"]
}

struct BookView: View {
    @ObservedObject var book: Book
    var body: some View {
        Text(book.title)
    }
}

struct LibraryView: View {
    @EnvironmentObject var library: Library
    @StateObject private var book = Book()
    
    var body: some View {
        BookView(book: book)
    }
}

struct BookEditView: View {
    @ObservedObject var book: Book
    var body: some View {
        TextField("Title", text: $book.title)
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("ContentView")
            BookView(book: Book())
                .previewDisplayName("BookView")
            LibraryView()
                .previewDisplayName("LibraryView")
            AppStorageView()
                .previewDisplayName("AppStorageView")
        }
    }
}

// MARK: What is the @AppStorage property wrapper? https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-appstorage-property-wrapper

//UserDefaults.standard.set("@twostraws", forKey: "username")`

struct AppStorageView: View {
    @AppStorage("username") var username: String = "Anonymous"

//    @AppStorage("username", store: UserDefaults(suiteName: "group.com.hackingwithswift.unwrap")) var username: String = "Anonymous"

    var body: some View {
        VStack {
            Text("Welcome, \(username)!")

            Button("Log in") {
                username = "@twostraws"
            }
        }
    }
}
