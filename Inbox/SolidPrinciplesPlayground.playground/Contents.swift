import SwiftUI

/*
 Single Responsibility
 Open/Closed
 Liskov Substitution
 Interface Segregation
 Dependency Inversion
 */

class Book {
    var name: String
    var author: String
    var text: String

    public func replaceWordInText(_ word: String, _ replacementWord: String) -> String {
        return text.replacing(word, with: replacementWord)
    }

    public func isWordInText(_ word: String) -> Bool {
        return word.contains(word)
    }
    // constructors, getters and setters
    init(name: String = "Peter", author: String = "Chomsky", text: String = "Hello World") {
        self.name = name
        self.author = author
        self.text = text
    }
}

public class BookPrinter {
    

}

Book.isWordInText(<#T##self: Book##Book#>)
