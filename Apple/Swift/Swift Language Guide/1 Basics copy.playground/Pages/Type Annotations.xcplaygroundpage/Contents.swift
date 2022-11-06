//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var welcomeMessage: String

var red, green, blue: Double

/*
 1. When you create a constant or variable but haven´t yet assigned it a value.
 2. When you create a constant or variable that could be inferred as more than one type
 3. When you write your own type definition
 Type inference or type annotation
 
 1. Telling Swift about possible errors that can happen
 2. Writing a function that can flag up errors if they happen
 3. Calling that function, and handling errors that might happen
 */

let surname = "Lasso"
let score = 0

var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

var teams: [String] = [String]()

var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

style = .dark

