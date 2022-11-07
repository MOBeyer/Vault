// Function Argument Labels and Paramaters Names
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)

// Specifying Argument Labels
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."

// Omitting Argument Labels
func someFunction2(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

func rollDice(sides: Int, count: Int) -> [Int] {
    
    // Start with an empty array
    var rolls = [Int]()
    
    // Roll as many dice as needed
    for _ in 1...count {
        
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

func isUppercas2(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercas2(string)

//                    ex  in
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

//MARK: Omitting parameter labels

func sumItems(_ items: [Double]) -> Double {
    var total: Double = 0
    for item in items {
        total += item
    }
    
    return total
}

sumItems([4, 6, 4.8])

func bounceOnTrampoline(times: Int) {
    for _ in 1...times {
        print("Boing!")
    }
}

bounceOnTrampoline(times: 10)

func greet(_ name: String) {
    print("Hi, \(name)!")
}
 greet("Moritz")

func countPoodles(dogs: [String]) -> Int {
    var sum = 0
    for dog in dogs {
        if dog == "Poodle" {
            sum += 1
    }
    
}
return sum
}

countPoodles(dogs: ["Mollie", "Penny", "Poppy", "Poodle"])

func climbMountain(_ name: String) {
    print("Im going to climb \(name).")
}

climbMountain("Everest")

