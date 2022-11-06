//: [Previous](@previous)

import Foundation



func greet(person: [String: String]) {
    
    guard let name = person["name"] else {
        fatalError()
    }


    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])

greet(person: ["name" : "Jane", "location": "Cupertino"])

greet(person: ["location": "New York"])

