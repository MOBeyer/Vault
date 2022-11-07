//MARK: Stored Properties

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//: Stored Properties of Constant Structure Instance

//let rangeFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeFourItems.firstValue = 6


//: Lazy stored properties

class DataImporter {
    
    
    var filename = "data.txt"
    // the DataManager class would provide data management functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}
/*
let manager - DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
 print(manager.importer.filename)
 */

//: Stored Properties and Instance Variables


//MARK: Computed Properties

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (")

//: Shorthand Setter Declaration

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//: Shorthand Getter Declaration

struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2), y: size.height / 2)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//: Read-Only Computed Properties

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


//: Property Observers

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896


//: Property Wrappers

// Separate Layer of distinction that manages how the property is stored
@propertyWrapper
struct TwelverOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelverOrLess var height: Int // private var _height = TwelverOrLess()
    @TwelverOrLess var width: Int // private var _width = TwelverOrLess()
    
    // var hight: Int {
    //     get { return _height.wrappedValue }
    //     set { _height.wrappedValue = newValue }
}
var rectangle = SmallRectangle()
print(rectangle.height)
rectangle.height = 10
print(rectangle.height)
rectangle.height = 24
print(rectangle.height)

//: Setting Initial Values for Wrapped Properties
//: Projecting a Value from a Property Wrapper

//MARK: Global and Local Variables
//MARK: Type Properties
//: Type Property Syntax
//: Querying and Setting Type Properties

//MARK: SwiftLee: Property Wrappers in Swift explained with code examples
// What is a Property Wrapper?

