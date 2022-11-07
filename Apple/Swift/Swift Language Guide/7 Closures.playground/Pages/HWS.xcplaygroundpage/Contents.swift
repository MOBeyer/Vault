//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//Using closures as parameters when they accept parameters

func travel(action: (String) -> Void) {
	print("I'm getting ready to go.")
	action("London")
	print("I arrived!")
}

travel { (place: String) in
	print("I'm going to \(place) in my car")
}

let changeSpeed = { (speed: Int) in
	print("Changing speed to \(speed)kph")
}

func buildCar(name: String, engine: (Int) -> Void) {
	// build the car
}

