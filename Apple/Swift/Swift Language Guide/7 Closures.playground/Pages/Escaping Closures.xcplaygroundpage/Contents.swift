//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
	completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
	closure()
}

class SomeClass {
	var x = 10
	func doSomething() {
		someFunctionWithEscapingClosure { self.x = 100 }
		someFunctionWithNonescapingClosure { x = 200 }
	}
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"

/*
class SomeOtherClass {
	var x = 10
	func doSomething() {
		someFunctionWithEscapingClosure { [self] in x = 100 }
		someFunctionWithNonescapingClosure { x = 200 }
	}
}

struct SomeStruct {
	var x = 10
	mutating func doSomething() {
		someFunctionWithNonescapingClosure { x = 200 }  // Ok
		someFunctionWithEscapingClosure { x = 100 }     // Error
	}
}
*/
