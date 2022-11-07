import Foundation

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()


struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}
//           Instance-Initializer
var archer = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)


//MARK: Creating your own structs test

struct ChessPiece {
    var name: String
    var value: Int
}

struct User {
    var name = "Anonymous"
    var age: Int
}
let twostraws = User(name: "Paul", age: 38)

struct Phone {
    var manufacturer: String
    var screenSize: Double
}

//MARK: Mutating methods test
struct Diary {
    var entries: String
    
    mutating func add(entry: String) {
        entries += "\(entry)"
    }
}

Diary.init(entries: "Hello Heeelp")

struct Surgeon {
    var operationsPerformed = 0
    
    mutating func operate(on patient: String) {
        print("Nurse, hand me the scalpel!")
        operationsPerformed += 1
    }
}
//  instance
var doctorWho = Surgeon()
doctorWho.operate(on: "Mr. X")
doctorWho.operate(on: "Mr. Y")
print(doctorWho.operationsPerformed)

struct Stapler {
    var stapleCount: Int
    
    mutating func staple() {
        if stapleCount > 0 {
            stapleCount -= 1
            print("Its stapled!")
        } else {
            print("Please refill me.")
        }
    }
}

var newsletterStaple = Stapler.init(stapleCount: 10)
newsletterStaple.staple()
print(newsletterStaple.staple())

struct Tree {
    var height: Double
    mutating func grow() {
        height *= 1.001
        
    }
}

struct Car {
    var mileage: Int
    mutating func drive(distance: Int) {
        mileage += distance
    }
}

struct Book {
    var totalPages: Int
    var pagesLeftToRead = 0
    
    mutating func read(pages: Int) {
        if pages < pagesLeftToRead {
            pagesLeftToRead -= pages
        } else {
            pagesLeftToRead = 0
            print("Im done!")
        }
    }
}

var eragon = Book(totalPages: 1000, pagesLeftToRead: 500)
eragon.read(pages: 20)
print(eragon)

struct MeetingRoom {
    var isBooked = true
    
    mutating func book(for name: String) {
        if isBooked {
            print("Sorry, the meeting room is already taken.")
        } else {
            isBooked = true
            print("It's reserved for \(name).")
        }
    }
}

var pornoRoom = MeetingRoom(isBooked: false)
pornoRoom.book(for: "Kevin")
print(pornoRoom)

struct Delorean {
    var speed = 0
    
    mutating func accelerate() {
        speed += 1
        if speed == 88 {
            travelThroughTime()
        }
    }
    func travelThroughTime() {
        print("Where we're going we don't need roads.")
    }
}

var ford = Delorean(speed: 5000)
ford.accelerate()
print(ford)


#if swift(>=5.2)
print("Hello, Swift 5.2")
#elseif swift(>=5.1)
print("Hello, Swift 5.1")
#elseif swift(>=5.0)
print("Hello, Swift 5.0")
#elseif swift(>=4.1)
print("Hello, Swift 4.1")
#elseif swift(>=4.0)
print("Hello, Swift 4.0")
#elseif swift(>=3.0)
print("Hello, Swift 3.x")
#else
print("Hello, Swift 2.2")
#endif


//MARK: Definition Syntax

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


//:MARK Structure and Class Instances

let someResolution = Resolution()
let someVideoMode = VideoMode()


//MARK: Accessing Properties

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// Dot syntax to assign a new value to a variable property
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")


//MARK: Memberwise Initializers for Structure Types


let vga = Resolution(width: 640, height: 480)


//MARK: Structures and Enumerations are Value Types


let hd = Resolution(width: 1920, height: 1080)

// Different Instance of Resolution
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case north, south, east, west
    
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()
print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")


//MARK: Classes are Reference Types

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
// new constant and frameRate modified -> two different names for the same instance
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//MARK: Identity Operators

    // check wether to constants refer to the same single class instance
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance")
}


//MARK: Pointers

