//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

class User {
    var name = "Paul"
}

var user = User()
user.name = "Taylor"
user = User()
print(user.name)
/*
 
 Variable classes can have variable properties changed
 Constant classes can have variable properties changed
 Variable structs can have variable properties changed
 Constant structs cannot have variable properties changed
 
 */

//MARK: Mutability test
class Pizza {
    
    private var toppings = [String]()
    func add(topping: String) {
        toppings.append(topping)
    }
}

var pizza = Pizza()
pizza.add(topping: "Mushrooms")

class Light {
    var onState = false
    func toggle() {
        if onState {
            onState = false
        } else {
            onState = true
        }
        print("Click")
    }
}
let light = Light()
light.toggle()

struct Code {
    var numberOfBugs = 100
    mutating func fixBug() {
        numberOfBugs += 3
    }
}
var code = Code()
code.fixBug()

class Phasers {
    var energyLevel = 100
    func firePhasers() {
        if energyLevel > 10 {
            print("Firing")
            energyLevel -= 10
        }
    }
}
var phasers = Phasers()
phasers.firePhasers()

class Sun {
    var isNova = false
    
    func goNova() {
        isNova = true
    }
}

let sun = Sun()
sun.goNova()

struct Barbecue {
    var charcoalBricks = 20
    mutating func addBricks(_ number: Int) {
        charcoalBricks += number
    }
}
var barbecue = Barbecue()
barbecue.addBricks(4)
