//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

struct Player {
    let name: String
    let number: Int
}

//           memberwise initializer
let player = Player(name: "Megan R", number: 15)

struct Player1 {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...9)
    }
}

let player2 = Player1(name: "Megan R")
print(player.number)

//MARK: Initializers test
struct Experiment {
    var cost = 0
}

let lhc = Experiment(cost: 13_250_000_000)

struct Wine {
    var grape: String
    var region: String
}

let malbec = Wine(grape: "Malbec", region: "Cahors")
print(malbec)

struct Dictionary {
    var words = Set<String>()
}

let dictionary = Dictionary()

struct Sport {
    var name: String
    var isOlympicSport: Bool
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: true)
print(chessBoxing)

struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}

var france = Country(countryName: "France")
print(france)

struct Message {
    var from: String
    var to: String
    var content: String
    init() {
        from = "Unknown"
        to = "Unknown"
        content = "Yo"
    }
}
let message = Message()
print(message)

struct PowerTool {
    var name: String
    var cost: Int
}

let drill = PowerTool(name: "Hammer Drill", cost: 80)

struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init(itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}

let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)

//MARK: Referring to the current instance

struct Conference {
    var name: String
    var location: String
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
let wwdc = Conference(name: "WWDC", location: "San Jose")
print(wwdc)

struct SuperHero {
    var nickname: String
    var powers: [String]
    
    init(nickname: String, superPowers: [String]) {
        self.nickname = nickname
        self.powers = superPowers
    }
}

let batman = SuperHero(nickname: "The Caped Crusader", superPowers: ["He's really rich"])
print(batman)

struct Kitchen {
    var utensils: [String]
    init(utensils: [String]) {
        self.utensils = utensils
    }
}

var modernKitchen = Kitchen.init(utensils: ["H", "G"])
print(modernKitchen)

struct Character {
    var name: String
    var actor: String
    var probablyGoingToDie: Bool
    
    init(name: String, actor: String) {
        self.name = name
        self.actor = actor
        if self.actor == "Sean Bean" {
            probablyGoingToDie = true
        } else {
            probablyGoingToDie = false
        }
    }
}

var mrSmith = Character(name: "Kevin", actor: "Sean Bean")
print(mrSmith)

struct Cottage {
    var rooms: Int
    var rating = 5
    init(rooms: Int) {
        self.rooms = rooms
    }
}
let bailbrookHouse = Cottage(rooms: 4)


