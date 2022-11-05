//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Remove all graphics at the same time.
 
 What if you had a single button that squished all the UFFs at the same time? Now you can write the code to do exactly that.
 
 Just like you do for a tool, you create a button and give it a name. `Button` has an `onPress` property that you can set to a function to handle “button press” events. In the code below, `squishEm()` is called any time `squishButton` is pressed.

 Each time you place a graphic on the scene in `addFructoid(touch:)`, the graphic is added to the `graphics` array. You can loop through this array and do something with each graphic.
 
 * callout(Iterate through graphics on the scene):
    `for graphic in graphics {`\
    `   // Do something with the graphic`\
    `}`

 1. Add code to the `squishEm()` function below, to iterate through the graphics on the scene and call `squishGraphic(graphic:)` for each.
 2. Run the code, then add some UFFs and try pressing **Squish ’Em!**.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, alpha, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, moveAndZap(to:), moveAndRemove(to:duration:), rotation)
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
        if assessmentInfo.context != .button { return nil }
        
        var removedGraphics: [Graphic] = []
        for event in assessmentInfo.events {
            if case .moveAndRemove(let graphic, _) = event {
                removedGraphics.append(graphic)
            }
        }
        if removedGraphics.count > 5 {
            return true
        }
        
        return nil
    }
}



public func playgroundPrologue() {
    registerEvaluator(PageAssessment(), style: .continuous)
}


public func playgroundEpilogue() {
    performAssessment()
    scene.shouldHideTools = false
}

public typealias _ImageLiteralType = Image

playgroundPrologue()

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheGreenFrontier@2x.png")

//#-end-hidden-code
//#-editable-code
let blackHole = Graphic(image: #imageLiteral(resourceName: "BlackHole@2x.png"))
let x = randomDouble(from: -400, to: 400)
let y = randomDouble(from: -400, to: 400)
scene.place(blackHole, at: Point(x: x, y: y))

//#-localizable-zone(ch4page08k1)
// Array of graphics on the scene.
//#-end-localizable-zone
var graphics: [Graphic] = [Graphic]()
let maxGraphics = 200

//#-localizable-zone(ch4page08k2)
// Remove graphic through the black hole.
//#-end-localizable-zone
func squishGraphic(graphic: Graphic) {
    graphic.moveAndRemove(to: blackHole.position, duration: randomDouble(from: 0.25, to: 2))
}

//#-localizable-zone(ch4page08k3)
// Remove all graphics.
//#-end-localizable-zone
func squishEm() {
//#-localizable-zone(ch4page08k4)
    // ✏️ Iterate through graphics and squish each one.
//#-end-localizable-zone
    
//#-localizable-zone(ch4page08k5)
    // Play a sound.
//#-end-localizable-zone
    playSound(.electricity)
//#-localizable-zone(ch4page08k6)
    // Empty the graphics array.
//#-end-localizable-zone
    graphics.removeAll()
}

//#-localizable-zone(ch4page08k7)
// UFF tool event handler.
//#-end-localizable-zone
func addFructoid(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    if graphics.count >= maxGraphics { return }

    let fruit = "🍏🍐🍊🍋🍉🍒🍓🍌".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphics.append(graphic)
    graphic.scale = 2.0
    
    let x = randomDouble(from: 50, to: 400)
    let y = randomDouble(from: 50, to: 400)
    let period = randomDouble(from: 8.0, to: 15.0)
    graphic.orbit(x: x, y: y, period: period)
}

//#-localizable-zone(ch4page08k8)
// Create and add UFF tool.
//#-end-localizable-zone
let fructoidTool = Tool(name: "/*#-localizable-zone(ch4page08UFFTool)*/UFF/*#-end-localizable-zone*/", emojiIcon: "🍋")
fructoidTool.onTouchMoved = addFructoid(touch:)
scene.tools.append(fructoidTool)

//#-localizable-zone(ch4page08k9)
// Create and add Squish tool.
//#-end-localizable-zone
let squishTool = Tool(name: "/*#-localizable-zone(ch4page08squishTool)*/Squish/*#-end-localizable-zone*/", emojiIcon: "💥")
squishTool.onGraphicTouched = squishGraphic(graphic:)
scene.tools.append(squishTool)

//#-localizable-zone(ch4page08k10)
// Create and add Squish ’Em! button.
//#-end-localizable-zone
let squishButton = Button(name: "/*#-localizable-zone(ch4page08squishEmButton)*/Squish ’Em!/*#-end-localizable-zone*/")
squishButton.onPress = squishEm
scene.button = squishButton
//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
