//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Choreograph a swarm of emoji dancers.
 
 When you run the code, 100 emoji dancer graphics are ready and waiting. Each time you press the **Dance** button, they perform another dance move. Try it!
 
 The `danceMoves` array holds a list of moves as instances of `DanceMove`, and each is created like this:
 
 * callout(Creating a dance move):
    `DanceMove(pattern: 8, note: 4, x: -180, y: 180)`
 
 * `pattern` is the way in which the dancers arrange themselves: Each has its own number.
 * `note` is the instrument note to play along with the move.
 * `x`, `y` are the coordinates for the center of the move.
 
 In `rearrange(graphics:index:)`, you’ll find code for each pattern, setting its shape, as well as the `scale` and `rotation` of the dancers. `twist` is the angle added to `rotation` for each dancer, and can be used along with `scale` to make some fascinating patterns.
 
 When you press **Dance**, the `dance()` function calls `rearrange(graphics:index:)` to make the next move. `danceIndex` points to the next move in the `danceMoves` array. At the end of the dance, `danceIndex` is reset to `0` to start over again.
 
 **Experiment:**
 
 * Try different sets of emoji—for example, flowers 🌺🌼🌸 or faces 😳😈😡.
 
 * Invent a new dance sequence by changing the moves in `danceMoves`.
 
 * In `rearrange(graphics:index:)`, change the parameters in the code for any of the patterns.
 
 * Add your own numbered patterns in `rearrange(graphics:index:)`, and create dance moves that use them.
 
 * **Challenge:** Add a second set of dancers, using different emoji, and have them dance independently.
 
 When you’re done with dancing emoji, move on to the [**next page**](@next).
*/
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, alpha, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, moveAndZap(to:), moveAndRemove(to:duration:), playSound(_:), playSound(_:volume:), playInstrument(_:note:), playInstrument(_:note:volume:), text, electricGuitar, bassGuitar, cosmicDrums, piano, bark, bluDance, bluLookAround, bluHeadScratch, bluOops, data, electricity, hat, knock, phone, pop, snare, tennis, tick, walrus, warp, rotation)
//#-code-completion(identifier, hide, PageAssessment, playgroundPrologue(), playgroundEpilogue(), Touch, Color, Scene, _ImageLiteralType)
//#-code-completion(description, show, "[Int]")

import UIKit
import CoreGraphics

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {
    
    // Custom per-page evaluation to determine pass/fail assessment.
    // Return `true` to mark the page as successful.
    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        return true
    }
}



public func playgroundPrologue() {
    registerEvaluator(PageAssessment(), style: .discrete)
    assessmentController?.shouldStopPageAfterDiscreteAssessment = false
}


public func playgroundEpilogue() {
    performAssessment()
    scene.shouldHideTools = false
}
public typealias _ImageLiteralType = Image

playgroundPrologue()

struct DanceMove {
    var pattern: Int
    var note: Int
    var x: Double
    var y: Double
}
//#-end-hidden-code
//#-editable-code
scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
let center = Point(x: 0, y: 0)
//#-localizable-zone(ch5page02k1)
// Emoji dancers.
//#-end-localizable-zone
let emoji = "❤️💛💚💙💜"
//#-localizable-zone(ch5page02k2)
// Array of dancers on the scene.
//#-end-localizable-zone
var dancers: [Graphic] = []

//#-localizable-zone(ch5page02k3)
// Create the dancers.
//#-end-localizable-zone
func createDancers() {
    var index = 0
    dancers = []
    let emojiCharacters = emoji.componentsByCharacter()
    for i in 0..<100 {
        let dancer = Graphic(text: emojiCharacters[index])
        scene.place(dancer, at: center)
        dancers.append(dancer)
        index += 1
        if index == emojiCharacters.count {
            index = 0
        }
    }
}

//#-localizable-zone(ch5page02k4)
// Sequence of dance moves.
//#-end-localizable-zone
let danceMoves = [
    DanceMove(pattern: 7, note: 10, x: 0, y: 0),
    DanceMove(pattern: 8, note: 9, x: 80, y: 80),
    DanceMove(pattern: 4, note: 5, x: -100, y: 100),
    DanceMove(pattern: 5, note: 6, x: -120, y: -120),
    DanceMove(pattern: 3, note: 1, x: 140, y: -140),
    DanceMove(pattern: 1, note: 12, x: 160, y: 160),
    DanceMove(pattern: 2, note: 7, x: -180, y: 180),
    DanceMove(pattern: 9, note: 8, x: 0, y: 0),
    DanceMove(pattern: 0, note: 4, x: 0, y: 0)
]

//#-localizable-zone(ch5page02k5)
// Rearrange dancers for a dance move.
//#-end-localizable-zone
func rearrange(graphics: [Graphic], index: Int) {
    if index >= danceMoves.count { return }
    
//#-localizable-zone(ch5page02k6)
    // Get the next move.
//#-end-localizable-zone
    let danceMove = danceMoves[index]
    
//#-localizable-zone(ch5page02k7)
    // Start with all points in the center.
//#-end-localizable-zone
    var points = [Point]()
    for i in 0..<graphics.count {
        points.append(center)
    }
    
//#-localizable-zone(ch5page02k8)
    // Default values.
//#-end-localizable-zone
    var scale = 0.5
    var rotation = 0.0
    var twist = 0.0
    
//#-localizable-zone(ch5page02k9)
    // Get points in a pattern:
    
    // 0: All in the center.
//#-end-localizable-zone
    if danceMove.pattern == 0 {
//#-localizable-zone(ch5page02k10)
        // Leave in the center.
//#-end-localizable-zone
    }
//#-localizable-zone(ch5page02k11)
    // 1: Random circle.
//#-end-localizable-zone
    if danceMove.pattern == 1 {
        let radius = randomDouble(from: 100, to: 300)
        points = scene.circlePoints(radius: radius, count: graphics.count)
        twist = 2.0
    }
//#-localizable-zone(ch5page02k12)
    // 2: Small circle.
//#-end-localizable-zone
    if danceMove.pattern == 2 {
        points = scene.circlePoints(radius: 50, count: graphics.count)
        scale = 0.5
        twist = 4.0
    }
//#-localizable-zone(ch5page02k13)
    // 3: Bigger circle.
//#-end-localizable-zone
    if danceMove.pattern == 3 {
        points = scene.circlePoints(radius: 200, count: graphics.count)
        scale = 3.0
        twist = -1.0
    }
//#-localizable-zone(ch5page02k14)
    // 4: Random twisted square.
//#-end-localizable-zone
    if danceMove.pattern == 4 {
        let width = randomDouble(from: 400, to: 300)
        points = scene.squarePoints(width: width, count: graphics.count)
        scale = 1.0
        twist = randomDouble(from: -5.0, to: 5.0)
    }
//#-localizable-zone(ch5page02k15)
    // 5: Random spiral.
//#-end-localizable-zone
    if danceMove.pattern == 5 {
        let spacing = randomDouble(from: 30, to: 100)
        points = scene.spiralPoints(spacing: spacing, count: graphics.count)
    }
//#-localizable-zone(ch5page02k16)
    // 6: Twisted spiral.
//#-end-localizable-zone
    if danceMove.pattern == 6 {
        points = scene.spiralPoints(spacing: 200, count: graphics.count)
        scale = 2.5
        twist = 2.5
    }
//#-localizable-zone(ch5page02k17)
    // 7: Square grid.
//#-end-localizable-zone
    if danceMove.pattern == 7 {
        points = scene.gridPoints(size: 240, count: graphics.count)
        scale = 0.5
    }
//#-localizable-zone(ch5page02k18)
    // 8: Diamond grid.
//#-end-localizable-zone
    if danceMove.pattern == 8 {
        points = scene.gridPoints(size: 300, count: graphics.count, angle: 45.0)
        scale = 0.5
    }
//#-localizable-zone(ch5page02k19)
    // 9: Random positions.
//#-end-localizable-zone
    if danceMove.pattern == 9 {
        for i in 0..<graphics.count {
            points[i].x = randomDouble(from: -500, to: 500)
            points[i].y = randomDouble(from: -500, to: 500)
        }
        scale = randomDouble(from: -0.25, to: 1.0)
        rotation = randomDouble(from: -360, to: 360)
        twist = 0.0
    }
    
//#-localizable-zone(ch5page02k20)
    // Shift to position (except random).
//#-end-localizable-zone
    if danceMove.pattern != 9 {
        for i in 0..<graphics.count {
            points[i].x += danceMove.x
            points[i].y += danceMove.y
        }
    }
    
//#-localizable-zone(ch5page02k21)
    // Get a random duration for the dance move.
//#-end-localizable-zone
    let duration = randomDouble(from: 0.25, to: 2.0)
    
//#-localizable-zone(ch5page02k22)
    // Animate the graphics to their new positions, applying scale and rotation.
//#-end-localizable-zone
    for i in 0..<graphics.count {
        graphics[i].move(to: points[i], duration: duration)
        graphics[i].scale = scale
        graphics[i].rotation = rotation
        rotation += twist
    }
    
//#-localizable-zone(ch5page02k23)
    // Play a note on the instrument.
//#-end-localizable-zone
    playInstrument(.cosmicDrums, note: danceMove.note, volume: 50)
}

var danceIndex = 0
createDancers()

//#-localizable-zone(ch5page02k24)
// Dance button event handler.
//#-end-localizable-zone
func dance() {
//#-localizable-zone(ch5page02k25)
    // Create the dancers if there aren't any.
//#-end-localizable-zone
    if scene.graphics.count == 0 {
        createDancers()
    }
//#-localizable-zone(ch5page02k26)
    // Do the dance move.
//#-end-localizable-zone
    rearrange(graphics: dancers, index: danceIndex)
//#-localizable-zone(ch5page02k27)
    // Get ready for the next dance move.
//#-end-localizable-zone
    danceIndex += 1
    if danceIndex >= danceMoves.count {
        danceIndex = 0
    }
}

//#-localizable-zone(ch5page02k28)
// Create and connect the Dance button.
//#-end-localizable-zone
let danceButton = Button(name: "/*#-localizable-zone(ch5page02danceButtonName)*/Dance/*#-end-localizable-zone*/")
danceButton.onPress = dance
scene.button = danceButton
//#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code

