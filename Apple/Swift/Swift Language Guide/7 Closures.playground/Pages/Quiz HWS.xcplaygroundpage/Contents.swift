//Creating basic closures

var connectVPN = {
    print("Connected!")
}
connectVPN()

var castVote = {
    print("I voted!")
}
castVote()

//Accepting parameters in a closure

let driving = { (place: String) in
    print("I am going to \(place) in my car")
}
driving("London")

var sendMessage = { (message: String) in
    if message != "" {
        print("Sending to Twitter: \(message)")
    } else {
        print("Your message was empty.")
    }
}

let rowBoat = { (distance: Int) in
    for _ in 1...distance {
        print("I'm rowing 1km.")
    }
}
rowBoat(5)

let fixCar = { (problem: String) in
    print("I fixed the \(problem).")
}

var click = { (button: Int) in
    if button >= 0 {
        print("Button \(button) was clicked.")
    } else {
        print("That button doesn't exist.")
    }
}

let watchTV = { (channel: String) in
    print("I'm going to watch some \(channel)")
}
watchTV("BBC News")

var cleanRoom = { (name: String) in
    print("I'm cleaning the \(name).")
}
cleanRoom("kitchen")



// Returning values from a closure
let drivingII = { (place: String) in
    print("Im going...")
}

var costToShootMovie = { (location: String) -> Int in
    if location == "UK" {
        return 1_000_000
    } else if location == "US" {
        return 5_000_000
    } else {
        return 500_000
    }
}

let bakeBirthdayCake = { (name: String) -> Int in
    print("I've made a cake for \(name); here's the bill.")
    return 50
}

let measureSize = { (inches: Int) -> String in
    switch inches {
    case 0...26:
        return "XS"
    case 27...30:
        return "S"
    case 31...34:
        return "M"
    case 35...38:
        return "L"
    default:
        return "XL"
    }
}
measureSize(36)

// Closures as parameters
let drivingIII = {
    print("im driving in my car")
}

func travel(action: () -> Void) {
    print("Im getting...")
    action()
    print("I arrived")
}
travel(action: drivingIII)

let helicopterTravel = {
    print("Get to the chopper!")
}
func travel(by travelMeans: () -> Void) {
    print("Let's go on vacation...")
    travelMeans()
}
travel(by: helicopterTravel)

var payCash = {
    print("Here's the money.")
}
func buyClothes(item: String, using payment: () -> Void) {
    print("I'll take this \(item).")
    payment()
}
buyClothes(item: "jacket", using: payCash)

var learnWithUnwrap = {
    print("Hey, this is fun!")
}
func learnSwift(using approach: () -> Void) {
    print("I'm learning Swift")
    approach()
}
learnSwift(using: learnWithUnwrap)

let swanDive = {
    print("SWAN DIVE!")
}
func performDive(type dive: () -> Void) {
    print("I'm climbing up to the top")
    dive()
}
performDive(type: swanDive)

// Trailing closure syntax
func travelV(action: () -> Void) {
    print("Im getting")
    action()
    print("I arrived")
}
travelV() {
    print("Im driving")
}

func travel(action: () -> Void) {
    print("")
}
