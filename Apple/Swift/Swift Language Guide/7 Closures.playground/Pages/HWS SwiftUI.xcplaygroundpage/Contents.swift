//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
/*
func greetUser() {
	print("Hi there!")
}

greetUser()

var greetCopy = greetUser

greetCopy()

let sayHello = {
	print("Hi there!")
}

sayHello()

//How to create a closure                 marker
let sayHello = { (name: String) -> String in
	"Hi \(name)!"
}
*/
//How to accept functions as parameters

//             parameter  accepting parameter
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
	var numbers = [Int]()
	
	for _ in 0..<size {
		let newNumber = generator()
		numbers.append(newNumber)
	}
	
	return numbers
}

let rolls = makeArray(size: 50) {
	Int.random(in: 1...20)
}

print(rolls)

/*
func generateNumber() -> Int {
	Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)
*/

/*
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
	print("About to start first work")
	first()
	print("About to start second work")
	second()
	print("About to start third work")
	third()
	print("Done!")
}

doImportantWork {
	print("This is the first work")
} second: {
	print("This is the second work")
} third: {
	print("This is the third work")
}
*/

let sayHello = { (name: String) -> String in
	"Hi \(name)!"
}

func getUserData(for id: Int) -> String {
	if id == 1989 {
		return "Taylor Swift"
	} else {
		return "Anonymous"
	}
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

sayHello("Taylor")
