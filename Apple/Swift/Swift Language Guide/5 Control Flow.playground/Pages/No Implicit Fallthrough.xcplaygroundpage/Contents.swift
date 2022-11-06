//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
/*:
No Implicit Fallthrough
In contrast with switch statements in C and Objective-C, switch statements in Swift don’t fall through the bottom of each case and into the next one by default. Instead, the entire switch statement finishes its execution as soon as the first matching switch case is completed, without requiring an explicit break statement. This makes the switch statement safer and easier to use than the one in C and avoids executing more than one switch case by mistake.

NOTE
Although break isn’t required in Swift, you can use a break statement to match and ignore a particular case or to break out of a matched case before that case has completed its execution. For details, see Break in a Switch Statement.
The body of each case must contain at least one executable statement. It isn’t valid to write the following code, because the first case is empty:
*/
let anotherCharacter: Character = "a"
switch anotherCharacter {
//  case "a": // Invalid, the case has an empty body
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// This will report a compile-time error.

switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"
/*:
For readability, a compound case can also be written over multiple lines. For more information about compound cases, see Compound Cases.

NOTE
To explicitly fall through at the end of a particular switch case, use the fallthrough keyword, as described in Fallthrough.
 */
