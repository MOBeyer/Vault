class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }

}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
        
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)

robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
let teslaX = Car(isElectric: true, isConvertible: false)

//MARK: Class inheritance test

class Vehiclee {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}

class Truck: Vehiclee {
    var goodCapacity: Int
    init(wheels: Int, goodCapacity: Int) {
        self.goodCapacity = goodCapacity
        super.init(wheels: wheels)
    }
}


class Handbag {
    var price: Int
    init(price: Int) {
        self.price = price
    }
}

class DesignerHandbag: Handbag {
    var brand: String
    init(brand: String, price: Int) {
        self.brand = brand
        super.init(price: price)
    }
}

class Bicycle {
    var color: String
    init(color: String) {
        self.color = color
        
    }
}

class MontainBike: Bicycle {
    var tireThickness: Double
    init(color: String, tireThickness: Double) {
        self.tireThickness = tireThickness
        super.init(color: color)
    }
}

class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}

class Printer {
    var cost: Int
    init(cost: Int) {
        self.cost = cost
    }
}

class LaserPrinter: Printer {
    var model: String
    init(model: String, cost: Int) {
        self.model = model
        super.init(cost: cost)
    }
}

