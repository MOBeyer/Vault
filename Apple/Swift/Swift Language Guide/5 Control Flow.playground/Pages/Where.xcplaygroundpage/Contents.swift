//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
    /*:
Where
A switch case can use a where clause to check for additional conditions.
    
    The example below categorizes an (x, y) point on the following graph:
 */
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"
/*:
../_images/coordinateGraphComplex_2x.png
The switch statement determines whether the point is on the green diagonal line where x == y, on the purple diagonal line where x == -y, or neither.

The three switch cases declare placeholder constants x and y, which temporarily take on the two tuple values from yetAnotherPoint. These constants are used as part of a where clause, to create a dynamic filter. The switch case matches the current value of point only if the where clause’s condition evaluates to true for that value.

As in the previous example, the final case matches all possible remaining values, and so a default case isn’t needed to make the switch statement exhaustive.
 */
