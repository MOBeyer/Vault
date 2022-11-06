//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// property observer?

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
    
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct BankAccount {
    var name: String
    var isMillionnaire = false
    
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
}

var moritzBankAccount = BankAccount.init(name: "Moritz", isMillionnaire: true, balance: 10)
print(moritzBankAccount)

struct Appp {
    var name: String
    var isOnSale: Bool {
        didSet {
            if isOnSale {
                print("Go and download my app!")
            } else {
                print("Maybe download it later.")
            }
        }
    }
}

var gameAppp = Appp(name: "Game", isOnSale: true)
print(gameAppp)

struct Child {
    var name: String
    var age: Int {
        didSet {
            print("Happy birthday, \(name)")
        }
    }
}

var secondChild = Child(name: "Test", age: 19)
print(secondChild)
secondChild = Child(name: "Test", age: 20)

struct Person {
    var clothes: String {
        didSet {
            print("I'm changing to \(clothes)")
        }
    }
}

var moritz = Person(clothes: "T-Shirt")
moritz.clothes = "V-Shirt"
print(moritz)

struct FishTank {
    var capacity: Int
    var fishCount: Int {
        didSet {
            if fishCount > capacity {
                print("You have too many fish!")
            }
        }
    }
}

var salmonTank = FishTank(capacity: 100, fishCount: 100)
print(salmonTank)
salmonTank.fishCount += 20

struct FootballMatch {
    let homeTeamScore: Int {
        didSet {
            print("Yay - we scored!")
        }
    }
    let awayteamScore: Int {
        didSet {
            print("Boo - they scored!")
        }
    }
}
