// Optional Tuple Return Types

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

  if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
      print("min is \(bounds.min) and max is \(bounds.max)")
  }
// Prints "min is -6 and max is 109"

//  if let bounds = minMax(array: []) {
//      print("min is \(bounds.min) and max is \(bounds.max)")
//  } 


// Fubctions With an Implicit Return
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))
// Prints "Hello, Dave!"

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))
// Prints "Hello, Dave!"












