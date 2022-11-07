//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
/*:
 Strings Are Value Types
 
 Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version. Value types are described in Structures and Enumerations Are Value Types.
 
 Swift’s copy-by-default String behavior ensures that when a function or method passes you a String value, it’s clear that you own that exact String value, regardless of where it came from. You can be confident that the string you are passed won’t be modified unless you modify it yourself.
 
 Behind the scenes, Swift’s compiler optimizes string usage so that actual copying takes place only when absolutely necessary. This means you always get great performance when working with strings as value types.
 

Working with Characters

You can access the individual Character values for a String by iterating over the string with a for-in loop:
 */
for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶
/*:
The for-in loop is described in For-In Loops.
    
    Alternatively, you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation:
*/

let exclamationMark: Character = "!"

/*:
String values can be constructed by passing an array of Character values as an argument to its initializer:
*/

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"
