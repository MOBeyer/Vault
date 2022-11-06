//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// How to check multiple conditions



let age = 16

if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

//What is the difference between if and else if?

let score = 9001

if score > 9000 {
    print("Its over 9000!")
} else {
    if score == 9000 {
        print("Its exactly 9000!")
    } else {
        print("Its not over 9000!")
    }
}

let isAdmin = true
let isOwner = true
let isEditingEnabled = true



if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}

let isAvailable: Bool = false
if isAvailable {
    print("Success")
} else {
    print("Failure")
}

let aa = true
let bb = true

if a && b {
    print("Hello, Swift")
}

let test = false

if test == false {
    print("Hello, Swift")
}

let loggedIn = true
let authorized = false

if loggedIn && authorized {
    print("Hello, Swift!")
}

let name1 = "Charlotte"
let name2 = "Sophie"


//if name1 is "Paul" or name2 is "Sophie"
  if name1 == "Paul" || name2 == "Sophie" {
     print("Hello, Swift!")
}

outer: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("Product is \(product)")
    }
}

