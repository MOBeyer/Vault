//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//How to handle multiple optionals using optional chaining chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}
var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

let namesI = ["Taylor", "Paul", "Adele"]
let lengthOfLast = names.last?.count

let credentials = ["twostraws", "fr0sties"]
let lowercaseUsername = credentials.first?.lowercased()

let songs: [String]? = [String]()
let finalSong = songs?.last?.uppercased()

func albumReleased(in year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    case 2017: return "Reputation"
    default: return nil
    }
}
let album = albumReleased(in: 2006)?.uppercased()

let shoppingList = ["eggs", "tomatoes", "grapefruit"]
let firstItem = shoppingList.first?.appending("are on my shopping list")

let captains: [String]? = ["Archer", "Lorca", "Sisko"]
let lengthOfBestCaptain = captains?.last?.count

let capitals = ["Scotland": "Edinburgh", "Wales": "Cardiff"]
let scottishCapital = capitals["Scotland"]?.uppercased()

let favoriteColors = ["Paul": "Red", "Charlotte": "Pink"]
let charlotteColor = favoriteColors["Charlotte"]?.lowercased()

let racers = ["Hamilton", "Verstappen", "Vettel"]
let winnerWasVE = racers.first?.hasPrefix("Ve")

