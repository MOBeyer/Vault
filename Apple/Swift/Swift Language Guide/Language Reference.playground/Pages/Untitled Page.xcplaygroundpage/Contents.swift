import UIKit

var greeting = "Hello, playground"

// String Literals

let string = #"\(x) \ " \u{2603}"#
let escaped = "\\(x) \\u{2603}"
print(string)
print(string == escaped)

//: Operators

//: Types

//: Type Annotation

let someTuple: (Double, Double) = (3.14156, 2.71828)
//func someFunction(a: Int) { /*...*/ }

//: Type Identifier

typealias Point = (Int, Int)
let origin: Point = (0, 0)



//var someValue: ExampleModule.MyType

// Grammar: type-identifier -> type-name generic-argument-clause "opt"| type-name generic-argument-clause"opt" .type-identifier

//: Tuple Type

var someTupleII = (top: 10, bottom: 12)
someTupleII = (top: 4, bottom: 42)
someTupleII = (9, 99)


//: Function Type

func someFunction(left: Int, right: Int) {}
func anotherFunction(left: Int, right: Int) {}
func functionWithDifferentLabels(top: Int, bottom: Int) {}

var f = someFunction // The type of f is (Int, Int) -> Void, not (left: Int, right: Int) -> Void

f = anotherFunction
f = functionWithDifferentLabels

func functionWithDifferentArgumentTypes(left: Int, right: String) {}
//f = functionWithDifferentArgumentTypes

func functionWithDifferentNumberOfArguments(left: Int, right: Int, top: Int) {}
//f = functionWithDifferentNumberOfArguments

//var operation: (lhs: Int, rhs: Int) -> Int
var operation: (_ lhs: Int, _ rhs: Int) -> Int
var operationII: (Int, Int) -> Int


//: Restrictions for Nonescaping Closures

let external: (() -> Void) -> Void = { _ in () }
//                                                                 property wrapper
//                    parameters are functions that are not marked @escaping -> cant be passed to another function
func takesTwoFunctions(first: (() -> Void) -> Void, second: (() -> Void) -> Void) {
// first { first {} }
// second { second {} }
// first { second {} }
// second { first {} }
}


//: Array Types

let someArray: Array<String> = ["Alex", "Brian", "Dave"]
let someArrayII: [String] = ["Alex", "Brian", "Dave"]

//multidimensional arrays
var array3D: [[[Int]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]


//: Dictionary Type

let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
let someDictionaryII: Dictionary<String, Int> = ["Alex": 31, "Paul": 39]


//: Optional Type

var optionalInteger: Int?
var optionalIntegerII: Optional<Int>

optionalInteger = 42
// Postfix Operator ! = Optional<Wrapped>
optionalInteger!
// Optional Chaining or Optional Binding -> if nil no operation is performed


//: Implicitly Unwrapped Optional Type

var implicitlyUnwrappedString: String!
var explicitlyUnwrappedString: Optional<String>

//let tupleOfImplicitlyUnwrappedElements: (Int!, Int!)
let implicitlyUnwrappedTuple: (Int, Int)!

//let arrayOfImplicitlyUnwrappedElements: [Int!]
let implicitlyUnwrappedArray: [Int]!

//: Protocol Composition type
//: Opaque Type
//: Metatype Type -> type of any type, including class types, structure types, enumeration types and protocol types

class SomeBaseClass {
    class func printClassName() {
        print("SomebaseClass")
    }
}
class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}
let someInstance: SomeBaseClass = SomeSubClass()
// The compile-time type of someInstance is SomeBaseClass, and the runtime type of someInstance is SomeSubClass
type(of: someInstance).printClassName()
// Prints "SomeSubClass"


//: Any Type

let mixed: [Any] = ["one", 2, true, (4, 5.3), { () -> Int in
    return 6 }]

if let first = mixed.first as? String {
    print("The first item, \(first) is a string")
}


//: Self Type
//: Type Inheritance Clause
//: Type Inference


