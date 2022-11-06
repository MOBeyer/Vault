//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
/*:
While Loops

A while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations isn’t known before the first iteration begins. Swift provides two kinds of while loops:

while evaluates its condition at the start of each pass through the loop.
repeat-while evaluates its condition at the end of each pass through the loop.
While
A while loop starts by evaluating a single condition. If the condition is true, a set of statements is repeated until the condition becomes false.

Here’s the general form of a while loop:

while condition {
    statements
}
This example plays a simple game of Snakes and Ladders (also known as Chutes and Ladders):
The rules of the game are as follows:

The board has 25 squares, and the aim is to land on or beyond square 25.
The player’s starting square is “square zero”, which is just off the bottom-left corner of the board.
Each turn, you roll a six-sided dice and move by that number of squares, following the horizontal path indicated by the dotted arrow above.
If your turn ends at the bottom of a ladder, you move up that ladder.
If your turn ends at the head of a snake, you move down that snake.
The game board is represented by an array of Int values. Its size is based on a constant called finalSquare, which is used to initialize the array and also to check for a win condition later in the example. Because the players start off the board, on “square zero”, the board is initialized with 26 zero Int values, not 25.
*/
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
/*:
Some squares are then set to have more specific values for the snakes and ladders. Squares with a ladder base have a positive number to move you up the board, whereas squares with a snake head have a negative number to move you back down the board.
*/
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")
    /*:
The example above uses a very simple approach to dice rolling. Instead of generating a random number, it starts with a diceRoll value of 0. Each time through the while loop, diceRoll is incremented by one and is then checked to see whether it has become too large. Whenever this return value equals 7, the dice roll has become too large and is reset to a value of 1. The result is a sequence of diceRoll values that’s always 1, 2, 3, 4, 5, 6, 1, 2 and so on.

After rolling the dice, the player moves forward by diceRoll squares. It’s possible that the dice roll may have moved the player beyond square 25, in which case the game is over. To cope with this scenario, the code checks that square is less than the board array’s count property. If square is valid, the value stored in board[square] is added to the current square value to move the player up or down any ladders or snakes.

NOTE
If this check isn’t performed, board[square] might try to access a value outside the bounds of the board array, which would trigger a runtime error.
The current while loop execution then ends, and the loop’s condition is checked to see if the loop should be executed again. If the player has moved on or beyond square number 25, the loop’s condition evaluates to false and the game ends.

A while loop is appropriate in this case, because the length of the game isn’t clear at the start of the while loop. Instead, the loop is executed until a particular condition is satisfied.
 */

var countdown = 10

while countdown > 0 {
    print("\(countdown)")
    countdown -= 1
}
print("Blast off!")

let id = Int.random(in: 1...1000)

let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!")

let colors = ["Red", "Green", "Blue", "Orange", "Yellow"]
var colorCounter = 0
while colorCounter < 5 {
    print("\(colors[colorCounter]) is a popular color.")
    colorCounter += 1
}

var counter = 2
while counter < 64 {
    print("\(counter) is a power of 2.")
    counter *= 2
}

var page: Int = 0
while page <= 5 {
    page += 1
    print("I'm reading page \(page).")
}

var cats: Int = 0

while cats < 10 {
    cats += 1
    print("I'm getting another cat.")
    if cats == 4 {
        print("Enough cats!")
        cats = 10
    }
}

//TODO: Questions?
var itemsSold: Int = 0

while itemsSold < 5000 {
    itemsSold += 100
    if itemsSold % 1000 == 1000 {
        print("\(itemsSold) items sold - a big milestone!")
    }
}

var number: Int = 10
while number > 0 {
    number -= 2
    if number % 2 == 0 {
        print("\(number) is an even number.")
    }
}

9 % 4

-9 % 4

var position = 5

while position > 0 {
    print("\(position)!")
    position -= 1
}

var averageScore = 2.5

while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}

var speed = 50
while speed <= 55 {
    print("Accelerating to \(speed)")
    speed += 1
}

