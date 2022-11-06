//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

let number = 139

//                   parameter
if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

//                    parameter
let roll = Int.random(in: 1...20)

//                    parameter
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

//                       argument
printTimesTables(number: 5, end: 20)

func printTimesTables2(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables2(for: 8)
printTimesTables2(for: 2, end: 1)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

//MARK: Default Parameters

func calculateWages(payBand: Int, isOvertime: Bool = false) -> Int {
    var pay = 10_000 * payBand
    if isOvertime {
        pay *= 2
    }
    return pay
}

calculateWages(payBand: 5, isOvertime: true)

func playGame(name: String, cheat: Bool = false) {
    if cheat {
        print("Let's play \(name); I bet I win!")
    } else {
        print("Let's play \(name)!")
    }
}

playGame(name: "Moritz", cheat: true)

func packLunchbox(number: Int, healthy: Bool = true) {
    for _ in 0..<number {
        if healthy {
            print("I'm packing a healthy lunchbox.")
        } else {
            print("Pizza for everyone!")
        }
    }
}

packLunchbox(number: 5, healthy: true)

func runRace(distance: Int = 10) {
    if distance < 5 {
        print("This should be easy!")
    } else if distance < 10 {
        print("This should be a nice challlenge.")
    } else {
        print("Lets do this")
    }
}

runRace(distance: 9)

