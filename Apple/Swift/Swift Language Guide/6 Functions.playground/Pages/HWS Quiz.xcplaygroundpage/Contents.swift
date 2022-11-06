//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Default parameters
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)")
    } else {
        print("Oh no... \(person)")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)

func goToWarp(speed: Int) {
    if speed > 9 {
        print("The engines")
    } else {
        print("Going to")
    }
}
goToWarp(speed: 1)

func parkCar(_ type: String, automatically: Bool = true) {
    if automatically {
        print("Nice - my \(type) parked itself!")
    } else {
        print("I guess I'll have to do it.")
    }
}
parkCar("Tesla")

// Variadic functions
/*
print("Haters", "gonna", "hate")
func square(number: Int...) {
    for number in numbers {
        print("\(number) square \(number * number)")
    }
}

square(number: 1, 2, 3, 4, 5)
*/

// Writing throwing functions
enum PrintError: Error {
    case invalidCount
}
func printPages(text: String, count: Int) throws {
    if count <= 0 {
        throw PrintError.invalidCount
    } else {
        for _ in 1...count {
            print("Printing \(text)...")
        }
    }
}

enum CatProblems: Error {
    case notACat
    case unfriendly
}
func strokeCat(_ name: String) throws {
    if name == "Mr Bitey" {
        throw CatProblems.unfriendly
    } else if name == "Lassie" {
        throw CatProblems.notACat
    } else {
        print("You stroked \(name).")
    }
}

enum LoginError: Error {
    case unknownUser
}
func authenticate(username: String) throws {
    if username == "Anonymous" {
        throw LoginError.unknownUser
    }
    print("Welcome, \(username)!")
}

enum PlayError: Error {
    case cheating
    case noPlayers
}
func playGame(name: String, cheat: Bool = false) throws {
    if cheat {
        throw PlayError.cheating
    } else {
        print("Let's play a game of \(name)...")
    }
}

// Running throwing functions
func doubleInPlace(number: inout Int) {
    number *= 2
}
var myNum = 10
doubleInPlace(number: &myNum)

func driveCar(_ type: String) {
    print("Im test d \(type)")
}
driveCar("Ferrari")

func showStartPrompt() {
    print("Tap the screen to begin")
}

enum ReadingErrors: Error {
    case tooBoring
}
func readBook(isFiction: Bool = true) throws {
    if isFiction {
        print("Story time!")
    } else {
        throw ReadingErrors.tooBoring
    }
}

func sumOfFactors(for number: Int) -> Int {
    var sum = 0
    for i in 1...number {
        if number % i == 0 {
            sum += i
        }
    }
    return sum
}
let sum = sumOfFactors(for: 100)

func play(games: String...) {
    for game in games {
        print("Let's play \(game)!")
    }
}
play(games: "Chess")

