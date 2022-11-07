import Foundation

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
	return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

/*
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
*/

reversedNames = names.sorted() { $0 > $1 }

reversedNames = names.sorted { $0 > $1 }

let digitNames = [
	0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
	5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
	var number = number
	var output = ""
	repeat {
		output = digitNames[number % 10]! + output
		number /= 10
	} while number > 0
	return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]

/*
func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
	if let picture = download("photo.jpg", from: server) {
		completion(picture)
	} else {
		onFailure()
	}
}

loadPicture(from: someServer) { picture in
someView.currentPicture = picture
} onFailure: {
print("Couldn't download the next picture.")
}
*/
