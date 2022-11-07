import UIKit
import Foundation

// Arrays/ Page 20-38



var greeting = "Hello, playground"

let fibs = [0, 1, 1, 2, 3, 4, 5]
var mutableFibs = [0, 1, 1, 2, 3, 5]

mutableFibs.append(8)
mutableFibs.append(contentsOf: [13, 21])
mutableFibs

var x = [1, 2, 3]
var y = x
y.append(4)

let a = NSMutableArray(array:[1, 2, 3])
// I dont want to be able to mutate b
let b:NSArray = a
// But it can still be mutated- via a
a.insert(2, at: 3)
b

let c = NSMutableArray(array:[1, 2, 3])
// I dont want to be able to mutate d
let d = c.copy()as!NSArray
c.insert(4, at: 3)

var squared: [Int] = []
for fib in fibs {
    squared.append(fib * fib)
}

extension Array {
    func map<T>(_ transform:(Element) -> T) -> [T] {
        var result: [T] = []
        result.reserveCapacity(count)
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}

let names = ["Paula", "Elena", "Zoe"]

var lastNameEndingInA: String?
for name in names.reversed() where name.hasSuffix("a") {
    lastNameEndingInA = name
    break
}
lastNameEndingInA

extension Sequence {
    func last(where predicate: (Element) -> Bool) -> Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }
}

let match = names.last { $0.hasSuffix("a") }

// Mutation and Statefil Closures

// Filter

let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
nums.filter { $0 % 2 == 0 }
print(nums.filter { $0 % 2 == 0 })

(1..<10).map { $0 * $0 }.filter { $0 % 2 == 0 }
print((1..<10).map { $0 * $0 }.filter { $0 % 2 == 0 })

extension Array {
    func filter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where isIncluded(x) {
            result.append(x)
        }
        return result
    }
}


/*
let evenNums = nums.filter { $0 % 2 == 0 }
evenNums.all { $0 % 2 == 0 }
*/

// Reduce

let numberRow = [0, 1, 1, 2, 3, 5]
var total = 0
for num in numberRow {
    total = total + num
}
total

let sum = fibs.reduce(0) { total, num in total + num }
fibs.reduce(0, +)

fibs.reduce("") { str, num in str + "\(num),"}

/*
extension Array {
    func reduce<Result>(_ initialResult: Result), _ nextPartialResult: (Result, Element) -> Result) -> Result {
        
        var result = initialResult
        for x in self {
            result = nextPartialResult(result, x)
        }
        return result
    }
}
*/

// A Flattening Map

let suits = ["♠️", "♥️", "♣️", "♦️"]
let ranks = ["A", "Q", "K", "A"]
let result = suits.flatMap { suit in
    ranks.map { rank in
        (suit, rank)
    }
}







// Iteration using forEach

// Array Types

// Slices

// Bridging













// Dictionaries / 38-42








// Sets / 38-42

// Ranges / 45-50


