// MARK:

// MARK-:

// FIXME: -> Method to fix

// TODO:  -> Method todo

/*
 
 MARK: Curriculum:
 
 Exploration
 
 MARK: Two Approaches:
 
 Swift:
 
 App development:
 
 MARK: Apps
 
 1. “The first project is List, a task-tracking app that allows the user to add, edit, and delete items in a familiar table-based interface. You'll be able to customize the app to track any type of information, such as a card collection, homework assignments, or a playlist. You'll learn how to build scroll views, table views, and complex input screens. You'll also learn how to save data, share data to other apps, and work with images in the user's photo library.
 
 2. The second project is Restaurant, a menu app that displays the available dishes from a restaurant and allows the user to submit an order. This project comes with an easy-to-use local web service that allows you to customize the entire menu with your own menu items and photos. You'll learn about animations, concurrency, and working with the web.
 The last project is Habits, a social network client that allows the user to log their favorite habits and keep track of how they rank against other users. This project also includes a customizable local web service that replicates the activity of a real social network with multiple simulated users. You'll learn about collection views and compositional[…]”
 
 Excerpt From
 Develop in Swift Data Collections
 Apple Education
 This material may be protected by copyright.
 
 */

/*
 Unit 1 Table and persistence
 
 Swift: 
 - Protocols
 
 SDK:
 - App Life Cycle
 - Model-View-Controller
 - Scroll Views
 - Table Views
 - Intermediate Table Views
 - System View Controllers
 - Saving Data
 - Complex Input Screens
 
 “What You'll Build
 List is a task-tracking app that allows the user to add, edit, and delete tasks in a familiar master-detail interface. You can customize the app to keep track of any type of information, such as a card collection or your favorite movies.”
 */
 
 // TODO: List Features:
 /*
 - Add
 - Edit
 - Delete
 - Customize App to keep track of any kind of information
 */

// MARK: Protocols

// TODO: Protocols learning list
/*
 - What protocols are and why theyre used
 
 - How to adopt and conform to Swift protols
 
 - How to print custom information about your custom objects to the console
 
 - How to check wether instances of your custom types are equatable to, greater than, or less than each other
 
 - How to set up your custom types so their instances can be saved to and loaded from a file
 
 - How to make one type perform work for another using delegation
 */


// MARK: Modules
import Foundation



// MARK: CustomStringConvertible
 
let string = "Hello, world!"
print(string)

let number = 42
print(number)

let boolean = false
print(boolean)

    
// But what if you define a Shoe class?

    //Adopt to "CustomStringConvertible"
class Shoe: CustomStringConvertible {
    let color: String
    let size: Int
    let hasLaces: Bool
    
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
    
    // Prints out what looks like an initializer for each object. 
    /*
    var description: String {
        return "Shoe(color: \(color), size: \(size), hasLaces: \(hasLaces)"
    }
 */
    var description: String {
        let doesOrDoesNot = hasLaces ? "does" : "does not"
        return "This shoe os \(color), size \(size), and \(doesOrDoesNot). have laces"
    }
}
let myShoe = Shoe(color: "Blck", size: 12, hasLaces: true)
let yourShoe = Shoe(color: "Red", size: 8, hasLaces: false)
print(myShoe)
print(yourShoe)

    
// MARK: Comparing Information with Equatable

struct Employee: Equatable, Comparable, Codable {
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}

struct Company {
    var name: String
    var employee: [Employee]
}

// FIXME: Equatable

/*
struct Session {
    var currentEmployee = Employee(firstName: "Daren", lastName: "Estrada", jobTitle: "Product Manager", phoneNumber: "415-555-0692")
    
    init(currentEmployee: String) {
        self.currentEmployee = currentEmployee
    }
}

let currentEmployee = Session.currentEmployee
let selectedEmployee = Employee(firstName: "Jacob", lastName: "Edwards", jobTitle: "Marketing Director", phoneNumber: "415-555-9293")

if currentEmployee == selectedEmployee {
    print("Edit")
}
 */


// MARK: Comparable

let employee1 = Employee(firstName: "Ben", lastName: "Atkins", jobTitle: "Front Desk", phoneNumber: "415-555-7767")
let employee2 = Employee(firstName: "Vera", lastName: "Carr", jobTitle: "CEO", phoneNumber: "515-555-7768")
let employee3 = Employee(firstName: "Grant", lastName: "Phelps", jobTitle: "Senior Manager", phoneNumber: "415-555-7770")
let employee4 = Employee(firstName: "Sang", lastName: "Han", jobTitle: "accountant", phoneNumber: "415-555-7771")
let employee5 = Employee(firstName: "Daren", lastName: "Estrada", jobTitle: "Sales Lead", phoneNumber: "415-555-7772")

let employees = [employee1, employee2, employee3, employee4, employee5]
let sortedEmployees = employees.sorted(by: <)

for employee in sortedEmployees {
    print(employee)
}

// Swift can read the different operators
let sortedEmployees2 = employees.sorted(by: >)
for employee in sortedEmployees2 {
    print(employee)
}

// MARK: Encoding and Decoding Objects with Codable

let ben = Employee(firstName: "Ben", lastName: "Atkins", jobTitle: "Front Desk", phoneNumber: "415-555-7767")

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(ben), let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}

// MARK: Creating a Protocol
// FIXME: Protocol

/*
protocol FullyNamed {
    var fullName: String { get }
    
    func sayFullName()
}

struct Person: FullyNamed {
    var firstName: String
    var lastName: String
}

struct Person: FullyNamed {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return 
    }
}
 
 */

//MARK: Delegation
/*
Very important when working with frameworks which have objects that define built-in functionality but require you to provide behavior specific your app. UIKit and other iOS frameworks use delegation extensively. They provide objects such as UIApplication, UITextField and UITableView which use delegation to customize their behavior. For example a UIApplicationDelegate can define how an app responds to remote notifications, a UITextFieldDelegate can validate text input and a UITableViewDelegate can perform actions when a row is tapped.
 */

// MARK: - APP Anatomy and Life Cycle

/*
What I will learn: 

How to execute code at different stages of the app life cycle

Vocabulary

[[active]]
app delegate
app state
background
foreground
scene delegate

Related Resources:
 */

// TODO: Life Cycle

// TODO: Model-View-Controller
// TODO: Scroll-Views
// TODO: Table-Views
// TODO: Intermediate Table Views

// MARK: - Saving Data
/*
What you will learn?
How to write and access files in your app Documents directory
How to serialize model data to a format that can be saved
How to serialize saved data to model data that can be used in the app
 */

// MARK: Encoding and decoding with codable
class Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

// FIXME: Encoder
/*
let newNote = Note(title: "Grocery run", text: "Pick up mayonaise, mustard, lettuce, tomato, and pickles", timestamp: Date())

let propertyListEncoder = PropertyListEncoder()
if let encodedNote = try? propertyListEncoder.encode(newNote) {
    print(encodedNote)
}
 */

// MARK: Writing Data to a File
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!


// TODO: Views
// TODO: Complex Input Screens

// MARK: Summary



