//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let planets = [1: "Mercury", 2: "Venus"]
let venus = planets[2, default: "Planet X"]

let capitals = ["England": "London", "Wales": "Cardiff"]

let scotlandCapital = capitals["Scotland"]
print(capitals)

let olympics = [2012: "London", 2016: "Rio", 2020: "Tokyo"]
let london = olympics[2012]

let books = ["Austin": "Pride and Prejudice"]
let dickens = books["Dickens", default: "Unknown"]

let albums = ["Prince": "Purple Rain"]
let beatles = albums["Beatles"]

let characters = ["Captain": "Malcolm", "England": "Kaylee"]
let captain = characters["Captain"]


