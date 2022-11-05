//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Build an amazing shape shifter!
 
 A **hypotrochoid** is a curve that you can make by rolling one circle around inside another, and following a point attached to the rolling circle. Hypotrochoids come in a whole variety of patterns, depending on these parameters:
 
 * r1: The radius of the outer circle
 * r2: The radius of the inner circle
 * d: How far the point you’re following is from the center of the inner circle, relative to its radius
 
 If you play around with these values, the hypotrochoid shifts its shape in fascinating ways—which is why they’re such fun.
 
 Run the code. Each time you press the **Random** button, a new hypotrochoid is created using randomly generated values for r1, r2, and d. Five hundred emoji graphics are then arranged in this shape.
 
 **Experiment:**
 
 * Try different sets of emoji; for example, `"🕛🕒🕕🕘"` or `"❄️"` or `"🌕🌖🌗🌘🌑🌒🌓🌔"`.
 * Adjust the minimum and maximum values for parameters r1, r2, and d.
 * Change the scale of the graphics.
 * Try `randomScaledPattern()` instead of `randomPattern()`. Can you see why these are different?
 
 You can learn more about hypotrochoids—and other extraordinary shapes—in the [Spirals](x-playgrounds://document/?contentIdentifier=com.apple.playgrounds.spirals) challenge.
 
 When you’re done, move on to the [**next page**](@next).
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
//#-end-hidden-code
//#-editable-code
scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")
let emoji = "🎾🏐"
//#-localizable-zone(ch5page04k1)
// Array of graphics on the scene.
//#-end-localizable-zone
var graphics: [Graphic] = []
let center = Point(x: 0, y: 0)
var previousPosition = center

let numberOfGraphics = 500

//#-localizable-zone(ch5page04k2)
// Hypotrochoid parameters:
// Radius of the outer circle.
//#-end-localizable-zone
var r1 = 100.0
//#-localizable-zone(ch5page04k3)
// Lowest value for r1.
//#-end-localizable-zone
let r1Min = 200.0
//#-localizable-zone(ch5page04k4)
// Highest value for r1.
//#-end-localizable-zone
let r1Max = 400.0

//#-localizable-zone(ch5page04k5)
// Radius of the inner circle.
//#-end-localizable-zone
var r2 = 100.0
//#-localizable-zone(ch5page04k6)
// Lowest value for r2.
//#-end-localizable-zone
let r2Min = 50.0
//#-localizable-zone(ch5page04k7)
// Highest value for r2.
//#-end-localizable-zone
let r2Max = 100.0

//#-localizable-zone(ch5page04k8)
// The distance of the point from the center of the inner circle divided by the radius (r2) of the inner circle.
//#-end-localizable-zone
var d = 1.0
//#-localizable-zone(ch5page04k9)
// Lowest value for d.
//#-end-localizable-zone
let dMin = 0.5
//#-localizable-zone(ch5page04k10)
// Highest value for d.
//#-end-localizable-zone
let dMax = 2.0

//#-localizable-zone(ch5page04k11)
// Places a new set of emoji graphics in the center of the scene.
//#-end-localizable-zone
func placeGraphics() {
    if scene.graphics.count != 0 { return }
    graphics = []
    var index = 0
    let emojiCharacters = emoji.componentsByCharacter()
    for i in 0..<numberOfGraphics {
        let graphic = Graphic(text: emojiCharacters[index])
        scene.place(graphic, at: center)
        graphics.append(graphic)
        index += 1
        if index == emojiCharacters.count {
            index = 0
        }
    }
}

//#-localizable-zone(ch5page04k12)
// Moves the graphics into a hypotrochoid pattern.
//#-end-localizable-zone
func randomPattern() {
    placeGraphics()
//#-localizable-zone(ch5page04k13)
    // Get random values for the hypotrochoid parameters.
//#-end-localizable-zone
    r1 = randomDouble(from: r1Min, to: r1Max)
    r2 = randomDouble(from: r2Min, to: r2Max)
    d = randomDouble(from: dMin, to: dMax)
//#-localizable-zone(ch5page04k14)
    // Get an array of count points in a hypotrochoid pattern.
//#-end-localizable-zone
    let points = scene.hypotrochoidPoints(r1: r1, r2: r2, d: d, count: graphics.count)
//#-localizable-zone(ch5page04k15)
    // Get a random time for moving the graphics to their new positions.
//#-end-localizable-zone
    let seconds = randomDouble(from: 0.25, to: 2.0)
//#-localizable-zone(ch5page04k16)
    // Get a random angle to rotate each graphic by.
//#-end-localizable-zone
    let rotation = randomDouble(from: -360, to: 360)
//#-localizable-zone(ch5page04k17)
    // Animate the graphics to their new positions.
//#-end-localizable-zone
    for i in 0..<graphics.count {
        graphics[i].move(to: points[i], duration: seconds)
        graphics[i].scale = 1.5
        graphics[i].rotation = rotation
    }
}

//#-localizable-zone(ch5page04k18)
// Moves the graphics into a hypotrochoid pattern, scaling up the graphics.
//#-end-localizable-zone
func randomScaledPattern() {
    placeGraphics()
//#-localizable-zone(ch5page04k19)
    // Get random values for the hypotrochoid parameters.
//#-end-localizable-zone
    r1 = randomDouble(from: r1Min, to: r1Max)
    r2 = randomDouble(from: r2Min, to: r2Max)
    d = randomDouble(from: dMin, to: dMax)
//#-localizable-zone(ch5page04k20)
    // Get an array of count points in a hypotrochoid pattern.
//#-end-localizable-zone
    let points = scene.hypotrochoidPoints(r1: r1, r2: r2, d: d, count: graphics.count)
//#-localizable-zone(ch5page04k21)
    // Get a random time for moving the graphics to their new positions.
//#-end-localizable-zone
    let seconds = randomDouble(from: 0.25, to: 2.0)
//#-localizable-zone(ch5page04k22)
    // Get a random angle to rotate each graphic by.
//#-end-localizable-zone
    let rotation = randomDouble(from: -360, to: 360)
//#-localizable-zone(ch5page04k23)
    // Animate the graphics to their new positions.
//#-end-localizable-zone
    var scale = 0.5
    for i in 0..<graphics.count {
        let point = Point(x: points[i].x * scale, y: points[i].y * scale)
        graphics[i].move(to: point, duration: seconds)
        graphics[i].scale = 2.5
        graphics[i].rotation = rotation
        scale += 0.0005
    }
}

//#-localizable-zone(ch5page04k24)
// Place all the graphics in the center initially.
//#-end-localizable-zone
placeGraphics()

//#-localizable-zone(ch5page04k25)
// Create and add the Random button.
//#-end-localizable-zone
let button = Button(name: "/*#-localizable-zone(ch5page04randomButton)*/Random/*#-end-localizable-zone*/")
button.onPress = randomPattern
scene.button = button
//#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
