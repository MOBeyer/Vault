//: [Previous](@previous)

import Foundation


//: [Next](@next)


/*
 1. If you are guard to check a functions inputs are valid, Swift will always require you to use return if the check fails
 2. If the check passes and the optional youre unwrapping has a value inside, you can use it after guard code finishes
 */

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

// When to use guard let rather than if let

func getMeaningOfLife() -> Int? {
    42
}

func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}

func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}

let input = 5
if let double = double(number: input) {
    print("\(input) doubled is \(double).")
}

func playScale(name: String?) {
    guard let name = name else {
        return
    }
    print("Playing th \(name) scale")
}
playScale(name: "C")

func uppercase(string: String?) -> String? {
    guard let string = string else {
        return nil
    }
    return string.uppercased()
}

if let result = uppercase(string: "Hello") {
    print(result)
}

func isLongEnough(_ string: String?) -> Bool {
    guard let string = string else { return false }
        
        if string.count >= 8 {
            return true
        } else {
            return false
        
    }
}

if isLongEnough("Mario Odyssey") {
    print("Lets play that")
}

func validate(password: String?) -> Bool {
    guard let passowrd = password else {
        return false
    }
    if password == "fr0sties" {
        print("Authenticate successfully!")
        return true
    }
    return false
}

validate(password: "fr0sties")

func test(number: Int?) {
    guard let number = number else { return }
        print("Number is \(number)")
    
}
test(number: 42)

func describe(occupation: String?) {
    guard let occupation = occupation else {
        print("You dont have a job")
        return
    }
    print("You are an \(occupation)")

}
let job = "engineer"
describe(occupation: job)

//How to unwrap optionals with nil coalescing?

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"



struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0

let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

var captain: String? = "Kathryn Janeway"
let name = captain ?? "Anonymous"

let planetNumber: Int? = 426
var destination = planetNumber ?? 3

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0

var userOptedIn: Bool? = nil
var optedIn = userOptedIn ?? false

var selectedYear: Int? = nil
let actualYear = selectedYear ?? 1989


