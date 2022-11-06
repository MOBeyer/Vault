import Foundation

//computed properties

//Getters

let pizzaInInches: Int = 10

var numberOfSlices: Int {
    // Getter
    get {
    return pizzaInInches - 4
    }
}

print(numberOfSlices)

let a = numberOfSlices * 2

