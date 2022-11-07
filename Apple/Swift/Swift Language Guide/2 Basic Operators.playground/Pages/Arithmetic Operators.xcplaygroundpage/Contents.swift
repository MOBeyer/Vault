//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
Arithmetic Operators

Swift supports the four standard arithmetic operators for all number types:

Addition (+)
Subtraction (-)
Multiplication (*)
Division (/)
1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0
Unlike the arithmetic operators in C and Objective-C, the Swift arithmetic operators don’t allow values to overflow by default. You can opt in to value overflow behavior by using Swift’s overflow operators (such as a &+ b). See Overflow Operators.

The addition operator is also supported for String concatenation:

"hello, " + "world"  // equals "hello, world"
