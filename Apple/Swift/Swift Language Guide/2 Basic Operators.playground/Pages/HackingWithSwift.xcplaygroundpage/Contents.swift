//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let age = 18
//            What?       True    False
let canVote = age >= 18 ? "Yes" : "No"

let hour = 23
print(hour < 12 ? "Its before noon": "Its after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

//               What             True     False
let background = theme == .dark ? "black": "white"

print(background)

print(hour < 12 ? "Its before noon": "Its after noon")

let phone = "iPhone"
//    Question             True        False
print(phone == "Android" ? "Failure" : "Success")

let numberOfCats = 21
print(numberOfCats >= 18 ? "Success" : "Failure")

let yourScore = 20
var highScore = 15
if yourScore >= highScore {
    print("You got the high score")
}

var poorRating = 0...10

var average = 10.0
average += 1.1

var ageII = 18
switch ageII {
case 0...8:
    fallthrough
case 9..<18:
    print("Yore")
default:
    print("Youre")
}

let height = 10
let width = 20
height < width

let tvShow = "Breaking" + "Bad"


