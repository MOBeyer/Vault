//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


//if trafficLight == "green" { go() }
//else { stop() }

/*
if trafficLight == "green" {
    go()
} else {
    stop()
}

if trafficLight == "green" {
    go()
} else if trafficLight == "amber" {
    useYourJudgement()
} else
    stop()
}
*/

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    if loveScore == 100 {
        print("You love each other like Kanye loves Kanye.")
    } else {
print("You´ll be forever alone")
}
}

loveCalculator()

/*
== Is equal to
!= Is not equal to
> Is greater than
< Is lesser than
>= Is greater or equal to
<= Is lesser or equal to
*/
/*
switch hardness {
case "Soft":
print(5)
case "Medium":
print(7)
case "Hard":
print (12)
default: 
 "No"
}

a...b Closed Range
a..<b Half Open Range
...b One Sided Range
*/
//  Key         Value
let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]

var dict: [String : Int] = ["Angela" : 777777]

dict["Angela"]


//            Data Type Optional
var hardness: String
