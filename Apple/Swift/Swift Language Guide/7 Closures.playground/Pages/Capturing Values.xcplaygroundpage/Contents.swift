//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//                   internal     external
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
	var runningTotal = 0
	
	// capture reference to running total and amount
	func incrementer() -> Int {
		runningTotal += amount
		return runningTotal
	}
	
	return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7#

incrementByTen()
// returns a value of 40

//Closures are reference types

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 50

incrementByTen()
// returns a value of 60
