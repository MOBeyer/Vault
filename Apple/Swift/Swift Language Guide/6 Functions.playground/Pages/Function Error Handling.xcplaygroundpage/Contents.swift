//: [Previous](@previous)

/*
 Telling Swift about the possible errors that can happen.
 Writing a function that can flag up errors if they happen.
 Calling that function, and handling any errors that might happen.
 
 Starting a block of work that might throw errors, using do.
 Calling one or more throwing functions, using try.
 Handling any thrown errors using catch.
 
 */

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
        
}

try checkPassword("GOOOOOOD")

func checkPassword1(_ password: String) throws -> String {
    let string = "12345"
    
    do {
        let result = try checkPassword(string)
        print("Password rating: \(result)")
    } catch PasswordError.short {
        print("Please use a longer password.")
    } catch PasswordError.obvious {
        print("I have the same combination on my luggage!")
    } catch {
        print("There was an error.")
    }
    return "Excellent"
}

try checkPassword1("Gooooood")
