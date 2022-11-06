//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func greetUser() {
	print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

let sayHello = { (name: String) -> String in
	"Hi \(name)!"
}

// var greetCopy: () -> Void = greetUser


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

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)
