import UIKit
import Foundation
import os

// Develop Swift in Data Collections

// Syntax
/*
func sum(numbers: [Int]) -> Int {
    // Code that adds together the numbers array
    return total
}
 
 let sumClosure = { (numbers: [Int]) -> Int in
 return total
 }
 
 let sum = sumClosure([1, 2, 3, 4])
 
 
*/

// 1 A closure with no parameters and no return value:

let printClosure = { () -> Void in
    print("This closure does not take any parameters and does not return a value")
}

// 2 A closure with parameters and no return value:

let printClosureII = { (string: String) -> Void in
    print(string)
}

// 3 A closure with no parameters and return value:

/*
let randomNumberClosure = { () -> Int in
    // Code that returns a random number
}
*/

// 4. A closure with parameters and a return value (as in the earlier example):

/*
let randomNumberClosure = { (minValue: Int, maxValue: Int) -> Int
    // Code that returns a random number between minValue and maxValue
}
*/

// Passing Closures as Arguements

struct Track {
    var trackNumber: Int
}

let tracks = [Track(trackNumber: 3), Track(trackNumber: 2), Track(trackNumber: 4)]

let sortedTracks = tracks.sorted { (firstTrack, secondTrack) -> Bool in
    return firstTrack.trackNumber < secondTrack.trackNumber
}

// Additional Syntactic Sugar
/*
struct TrackII: Comparable {
    var trackNumber: Int
    
    static func < (lhs: Track, rhs: Track) -> Bool {
        return lhs.trackNumber < rhs.trackNumber
    }
}

let tracks = [Track(trackNumber: 3), Track(trackNumber: 2), Track(trackNumber: 1), Track(trackNumber: 4)]
let sortedTracks = tracks.sorted(by: <)
*/

// Trailing Closure Syntax



// Collection Function Using Closures


//MARK: Map

// Initial array
let names = ["Johnny", "Nellie", "Aaron", "Rachel"]

// Creates an empty array that will be used to store the full names
var fullNames: [String] = []

for name in names {
    let fullName = name + "Smith"
    fullNames.append(fullName)
}

// Creates a new array of full names by adding "Smith" to each first name
let fullNamesII = names.map { (name) -> String in
    return name + " Smith"
}

// Closures Captures Their Environment

let fullNamesIII = names.map { $0 + " Smith"}


//MARK: Filter


