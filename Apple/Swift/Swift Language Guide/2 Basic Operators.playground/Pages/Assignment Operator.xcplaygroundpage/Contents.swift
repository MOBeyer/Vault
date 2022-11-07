//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
    /*:
Assignment Operator

The assignment operator (a = b) initializes or updates the value of a with the value of b:
 */

let b = 10
var a = 5
a = b
// a is now equal to 10
    
/*:
If the right side of the assignment is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once:
 */

let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2

    /*:
Unlike the assignment operator in C and Objective-C, the assignment operator in Swift doesn’t itself return a value. The following statement isn’t valid:
 */
//      if x = y {
    // This isn't valid, because x = y doesn't return a value.
//  }
/*:
This feature prevents the assignment operator (=) from being used by accident when the equal to operator (==) is actually intended. By making if x = y invalid, Swift helps you to avoid these kinds of errors in your code.
 */
    /*:
Remainder Operator
The remainder operator (a % b) works out how many multiples of b will fit inside a and returns the value that’s left over (known as the remainder).

NOTE
The remainder operator (%) is also known as a modulo operator in other languages. However, its behavior in Swift for negative numbers means that, strictly speaking, it’s a remainder rather than a modulo operation.
Here’s how the remainder operator works. To calculate 9 % 4, you first work out how many 4s will fit inside 9:
 
 You can fit two 4s inside 9, and the remainder is 1 (shown in orange).
 
 In Swift, this would be written as:
 */
9 % 4    // equals 1
    /*:
To determine the answer for a % b, the % operator calculates the following equation and returns remainder as its output:

a = (b x some multiplier) + remainder

where some multiplier is the largest number of multiples of b that will fit inside a.

Inserting 9 and 4 into this equation yields:

9 = (4 x 2) + 1

The same method is applied when calculating the remainder for a negative value of a:
 */

-9 % 4   // equals -1
    /*:
Inserting -9 and 4 into the equation yields:
 
-9 = (4 x -2) + -1
 
giving a remainder value of -1.

The sign of b is ignored for negative values of b. This means that a % b and a % -b always give the same answer.
 
Unary Minus Operator
The sign of a numeric value can be toggled using a prefixed -, known as the unary minus operator:
 */
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
    /*:
The unary minus operator (-) is prepended directly before the value it operates on, without any white space.

Unary Plus Operator
The unary plus operator (+) simply returns the value it operates on, without any change:
 */
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
    /*:
Although the unary plus operator doesn’t actually do anything, you can use it to provide symmetry in your code for positive numbers when also using the unary minus operator for negative numbers.
 */




