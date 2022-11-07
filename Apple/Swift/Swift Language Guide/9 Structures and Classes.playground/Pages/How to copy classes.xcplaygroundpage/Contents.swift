//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()

var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)

//How to call the copy?

struct GalacticaCrew {
    var isCylon = false
}

var starbuck = GalacticaCrew()
var tyrol = starbuck
tyrol.isCylon = true
print(starbuck.isCylon)
print(tyrol.isCylon)

class Statue {
    var sculptor = "Unknown"
}

//MARK: Copying Objects

var venusDeMilo = Statue()
venusDeMilo.sculptor = "Alexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)

class Starship {
    var maxWarp = 9.0
}

var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)

struct Calculator {
    var currentTotal = 0
}

var baseModel = Calculator()
var casio = baseModel
var texas = baseModel
casio.currentTotal = 556
texas.currentTotal = 384
print(casio.currentTotal)
print(texas.currentTotal)

class Author {
    var name = "Anonymous"
}

var dickens = Author()
dickens.name = "Charles Dickens"
var austen = dickens
austen.name = "Jane Austen"
print(dickens.name)
print(austen.name)

class Ewok {
    var fluffinessPercentage = 100
}

var chirpa = Ewok()
var wicket = Ewok()

chirpa.fluffinessPercentage = 90
print(wicket.fluffinessPercentage)
print(chirpa.fluffinessPercentage)

class Queen {
    var isMotherOfDragons = false
}
var elizabeth = Queen()
var daenerys = Queen()

daenerys.isMotherOfDragons = true
print(elizabeth.isMotherOfDragons)
print(daenerys.isMotherOfDragons)

class BasketballPlayer {
    var height = 200.0
}
var lebron = BasketballPlayer()
lebron.height = 203.0
var curry = BasketballPlayer()
curry.height = 190
print(lebron.height)
print(curry.height)

