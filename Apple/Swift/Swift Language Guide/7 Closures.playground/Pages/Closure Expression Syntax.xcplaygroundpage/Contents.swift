//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

print(captainFirstTeam)

let reverseTeam = team.sorted { $0 > $1 }

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser
greetUser()

//             1. para    2. para             1. ret     2. ret
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 60) {
    Int.random(in: 1...20)
}
print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

var playWithDog = {
    print("Fetch!")
}

var makeFromStrav = {
    print("Let's build it out of straw")
}

let awesomeTalk = {
    print("heres a great talk!")
}
func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}
deliverTalk(name: "My Awesome Talk", type: awesomeTalk)

let swanDive = {
    print("SWAN DIVE!")
}
func performDive(type dive: () -> Void) {
    print("Im climbing up to the top")
    dive()
}
performDive(type: swanDive)

let helicopterTravel = {
    print("Get to the chopper!")
}
//          ex in
func travel(by travelMeans: () -> Void) {
    print("Lets go on vacation...")
    travelMeans()
}
travel(by: helicopterTravel)

let evilRobot = {
    print("EXTERMINATE")
}

func buildRobot(personality: () -> Void) {
    print("Time...")
    personality()
}
buildRobot(personality: evilRobot)

var goOnBike = {
    print("Ill take my bicycle.")
}
func race(using vehicleType: () -> Void) {
    print("Lets..")
    vehicleType()
}

race(using: goOnBike)

let driveSafely = {
    
}
