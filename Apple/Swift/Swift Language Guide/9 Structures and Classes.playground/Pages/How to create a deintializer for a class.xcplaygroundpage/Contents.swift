//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()

//MARK: Deintializers test

class Job {
    deinit {
        print("I quit!")
    }
}

class IceCream {
    deinit {
        print("No more icecream")
    }
}

class Lightsaber {
    deinit {
        print("Fssshhp!")
    }
}

class DisneyMovie {
    deinit {
        print("Relax, there'll be another in a year.")
    }
}

class MagicSpell {
    deinit {
        print("Good job, Hermione!")
    }
}
