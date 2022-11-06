//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
/*:
Function Parameters and Return Values

Function parameters and return values are extremely flexible in Swift. You can define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options.

Functions Without Parameters
Functions aren’t required to define input parameters. Here’s a function with no input parameters, which always returns the same String message whenever it’s called:
*/

func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// Prints "hello, world"

/*:
The function definition still needs parentheses after the function’s name, even though it doesn’t take any parameters. The function name is also followed by an empty pair of parentheses when the function is called.

Functions With Multiple Parameters
Functions can have multiple input parameters, which are written within the function’s parentheses, separated by commas.

This function takes a person’s name and whether they have already been greeted as input, and returns an appropriate greeting for that person:
*/

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))
// Prints "Hello again, Anna!"

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim!"

/*:
You call the greet(person:alreadyGreeted:) function by passing it both a String argument value labeled person and a Bool argument value labeled alreadyGreeted in parentheses, separated by commas. Note that this function is distinct from the greet(person:) function shown in an earlier section. Although both functions have names that begin with greet, the greet(person:alreadyGreeted:) function takes two arguments but the greet(person:) function takes only one.

Functions Without Return Values
Functions aren’t required to define a return type. Here’s a version of the greet(person:) function, which prints its own String value rather than returning it:
*/

func greet1(person: String) {
    print("Hello, \(person)!")
}
greet1(person: "Dave")
// Prints "Hello, Dave!"

/*:
Because it doesn’t need to return a value, the function’s definition doesn’t include the return arrow (->) or a return type.

NOTE

Strictly speaking, this version of the greet(person:) function does still return a value, even though no return value is defined. Functions without a defined return type return a special value of type Void. This is simply an empty tuple, which is written as ().
The return value of a function can be ignored when it’s called:
*/

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but doesn't return a value

/*:
The first function, printAndCount(string:), prints a string, and then returns its character count as an Int. The second function, printWithoutCounting(string:), calls the first function, but ignores its return value. When the second function is called, the message is still printed by the first function, but the returned value isn’t used.

NOTE

Return values can be ignored, but a function that says it will return a value must always do so. A function with a defined return type can’t allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error.
Functions with Multiple Return Values
You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.

The example below defines a function called minMax(array:), which finds the smallest and largest numbers in an array of Int values:
*/

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

/*:
The minMax(array:) function returns a tuple containing two Int values. These values are labeled min and max so that they can be accessed by name when querying the function’s return value.

The body of the minMax(array:) function starts by setting two working variables called currentMin and currentMax to the value of the first integer in the array. The function then iterates over the remaining values in the array and checks each value to see if it’s smaller or larger than the values of currentMin and currentMax respectively. Finally, the overall minimum and maximum values are returned as a tuple of two Int values.

Because the tuple’s member values are named as part of the function’s return type, they can be accessed with dot syntax to retrieve the minimum and maximum found values:
*/



/*:
Note that the tuple’s members don’t need to be named at the point that the tuple is returned from the function, because their names are already specified as part of the function’s return type.

Optional Tuple Return Types
If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.

NOTE

An optional tuple type such as (Int, Int)? is different from a tuple that contains optional types such as (Int?, Int?). With an optional tuple type, the entire tuple is optional, not just each individual value within the tuple.
The minMax(array:) function above returns a tuple containing two Int values. However, the function doesn’t perform any safety checks on the array it’s passed. If the array argument contains an empty array, the minMax(array:) function, as defined above, will trigger a runtime error when attempting to access array[0].

To handle an empty array safely, write the minMax(array:) function with an optional tuple return type and return a value of nil when the array is empty:
*/

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
/*:
You can use optional binding to check whether this version of the minMax(array:) function returns an actual tuple value or nil:
*/

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"

/*:
Functions With an Implicit Return
If the entire body of the function is a single expression, the function implicitly returns that expression. For example, both functions below have the same behavior:
*/
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))
// Prints "Hello, Dave!"

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))
// Prints "Hello, Dave!"
/*:
The entire definition of the greeting(for:) function is the greeting message that it returns, which means it can use this shorter form. The anotherGreeting(for:) function returns the same greeting message, using the return keyword like a longer function. Any function that you write as just one return line can omit the return.

As you’ll see in Shorthand Getter Declaration, property getters can also use an implicit return.

NOTE

The code you write as an implicit return value needs to return some value. For example, you can’t use fatalError("Oh no!") or print(13) as an implicit return value.
*/

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    
    //one line of code, remove return
   string1.sorted() == string2.sorted()
}

areLettersIdentical(string1: "qwe", string2: "ewq")
print(areLettersIdentical(string1: "qwe", string2: "ewq"))

func pythagoras(a: Double, b: Double) -> Double {
    //expression
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

func greet(name: String) -> String {
    
//   name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
    
    if name == "Taylor Swift" {
        return "Oh wow!"
    } else {
        return "Hello, \(name)"
    }
}

func writeToLog(message: String) -> Bool {
    if message != "" {
        print("Log: \(message)")
        return true
    } else {
        return false
    }
}

writeToLog(message: "Test")

func format(number: Int) -> String {
    "The number is \(number)"
}

func countMultiplesOf10(numbers: [Int]) -> Int {
    var result = 0
    for number in numbers {
        if number % 10 == 0 {
            result += 1
        }
    }
    return result
}

countMultiplesOf10(numbers: [5, 10, 15, 20, 25])

func isEveryoneAdult(ages: [Int]) -> Bool {
    for age in ages {
        if age < 18 {
            return false
        }
    }
    return true
}

isEveryoneAdult(ages: [10, 20, 16, 24])

//MARK: How to return multiple values from functions?

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

isUppercase(string: "Hello")


func getUser() -> [String: String] {
    ["firstName": "Taylor",
     "lastName": "Swift"
    ]
}

let user = getUser()
print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")


func callUser() -> (firstName: String, lastName: String) {
    //because one row and swift knows the names for each tuple
    ("Taylor", "Swift")
}

let (firstName, lastName) = callUser()
print("Name: \(firstName) \(lastName)")


