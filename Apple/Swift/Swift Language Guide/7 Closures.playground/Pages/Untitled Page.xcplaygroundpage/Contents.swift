//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func greetUser() {
    print("Hi there!")
}

greetUser()

//create a copy of the function
var greetCopy = greetUser
greetCopy()

//closure expression
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

// Type Annotation
//
// var greetCopy: () -> Void = greetUser

func getUserData(for id: Int) -> String {
    if id == 1998 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

//        parameters of the function
let data: (Int) -> String = getUserData

//         argument for external function
let user = data(1989)
print(user)
sayHello("Taylor")

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted(by: captainFirstSorted)
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainSecondTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainSecondTeam)

//MARK: Creating basic closures test

let learnSwift = {
    print("Closures are like functions")
}
learnSwift()

let greetUserToday = {
    print("Hi there!")
}
greetUserToday()

//MARK: Accepting parameters in a closure

var cleanRoom = { (name: String) in
    print("I'm cleaning the \(name).")
}

cleanRoom("kitchen")

var sendMessage = { (message: String) in
    if message != "" {
        print("Sending to Twitter: \(message)")
    } else {
        print("Your message was empty.")
    }
}

sendMessage("Heeelp")

var click = { (button: Int) in
    if button >= 0 {
        print("Button \(button) was clicked.")
    } else {
        print("That button doesn't exist.")
    }
}

click(10)

var shareWinnings = { (amount: Double) in
    let half = amount / 2.0
    print("It's \(half) for me and \(half) for you.")
}

shareWinnings(5)

var pickFruit = {(name: String) in
    switch name {
    case "strawberry":
        fallthrough
    case "raspberry":
        print("Strawberries and raspberries are half price!")
    default:
        print("We dont have those.")
    }
}

pickFruit("strawberry")

let fixCar = { (problem: String) in
    print("I fixed the \(problem).")
}

fixCar("Motor")

let makeReservation = { (people: Int) in
    print("Id like a table for \(people), please")
}

let watchTV = { (channel: String) in
    print("I'm going to watch some \(channel)")
}
watchTV("BBC News")

let rowBoat = { (distance: Int) in
    for _ in 1...distance {
        print("I'm rowing 1km.")
    }
}
rowBoat(5)

//MARK: Returning values from a closure test

var flyDrone = { (hasPermit: Bool) -> Bool in
    if hasPermit {
            print("Let's find somewhere safe!")
            return true
    }
    print("Thats against the law.")
    return false
}

flyDrone(false)

let measureSize = { (inches: Int) -> String in
    switch inches {
        case 0...26:
            return "XS"
        case 27...30:
            return "S"
        case 31...34:
            return "M"
        case 35...38:
            return "L"
        default:
            return "XL"
    }
}
measureSize(36)

var difficultyRating = { (trick: String) -> Int in
    if trick == "ollie" {
            return 1
        } else if trick == "Yoyo Plant" {
            return 3
        } else if trick == "900" {
            return 5
        } else {
            return 0
        
    }
}
    print(difficultyRating("ollie"))

var costToShootMovie = { (location: String) -> Int in
    if location == "UK" {
        return 1_000_000
    } else if location == "US" {
        return 5_000_000
    } else {
        return 500_000
    }
}

costToShootMovie("UK")

let writeEssay = { (topic: String) -> String in
    return "Here's an essay on \(topic)."
}

var buyMagazine = { (name: String) -> Int in
    let amount = 10
    print("\(name) costs \(amount)")
    return amount
}
buyMagazine("Wired")

let bakeBirthdayCake = { (name: String) -> Int in
    print("I've made a cake for \(name); here's the bill.")
    return 50
}
