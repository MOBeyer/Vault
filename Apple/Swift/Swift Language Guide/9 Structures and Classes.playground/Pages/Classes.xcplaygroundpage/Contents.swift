
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var newGame = Game()
newGame.score += 10

    //What can I do with this class?
class BoardGame {
    var name: String
    var miximumPlayers = 1
    var maximumPlayers = 4
    
    init(name: String) {
        self.name = name
    }
}

class TIE {
    var name: String
    var speed: Int
    init(name: String, speed: Int) {
        self.name = name
        self.speed = speed
    }
}

let fighter = TIE(name: "TIE Fighter", speed: 50)

let interceptor = TIE(name: "TIE Interceptor", speed: 70)

class Shape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    } 
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides)"
        
    }
}

class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
print(test.area())

class VideoGame {
    var hero: String
    var enemy: String
    init(heroName: String, enemyName: String) {
        self.hero = heroName
        self.enemy = enemyName
    }
}

class Image {
    var filename: String
    var isAnimated: Bool
    init(filename: String, isAnimated: Bool) {
        self.filename = filename
        self.isAnimated = isAnimated * 2
    }
}

class ThemeParl {
    var entryPrice: Int
    var rides: [String]
    init(rides: [String]) {
        self.rides = rides
        self.entryPrice = rides.count * 2    
    }
}

