//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

// flip booleans
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// toggle()
var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)

gameOver.toggle()
print(gameOver)
