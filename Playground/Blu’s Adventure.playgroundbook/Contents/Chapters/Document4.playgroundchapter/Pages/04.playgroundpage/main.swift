//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Make tools for different types of events.
 
 What if you want something to happen when you touch a graphic, like make it bigger? Touching a graphic sends a “graphic touched” event. A function that handles this event takes a `Graphic` parameter to tell the function which graphic was touched.
 
 * callout(Example of a “graphic touched” event handler):
    `func fattenAlien(graphic: Graphic) {   }`
 
 Different events carry different information, so they need different event handler functions. For example, a function to handle a “touch moved” event has a `Touch` parameter with information about the touch.
 
 * callout(Example of a “touch moved” event handler):
    `func addAlien(touch: Touch) {   }`
 
 Event handlers have to be called when an event occurs, and that’s the job of the tool. `Tool` has an `onGraphicTouched` property that you can set to any “graphic touched” event handler.
 
 * callout(Setting the “graphic touched” event handler):
    `tool1.onGraphicTouched = fattenAlien(graphic:)`
 
 `Tool` also has an `onTouchMoved` property that accepts any “touch moved” event handler.
 
 * callout(Setting the “touch moved” event handler):
    `tool2.onTouchMoved = addAlien(touch:)`
 
 In the code below, see if you can swap the event handlers so that **Tool 1** responds to “graphic touched” events, and **Tool 2** responds to “touch moved” events. Once you’re done, move on to the [**next page**](@next).
*/
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, rotation)
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

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
//#-end-hidden-code
//#-editable-code
//#-localizable-zone(ch4page04k1)
// A “touch moved” event handler.
//#-end-localizable-zone
func addAlien(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let graphic = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
    scene.place(graphic, at: touch.position)
}

//#-localizable-zone(ch4page04k2)
// A “graphic touched” event handler.
//#-end-localizable-zone
func fattenAlien(graphic: Graphic) {
    graphic.scale *= 1.5
}

//#-localizable-zone(ch4page04k3)
// Create Tool 1.
//#-end-localizable-zone
let tool1 = Tool(name: "/*#-localizable-zone(tool1)*/Tool 1/*#-end-localizable-zone*/", emojiIcon: "1️⃣")
//#-localizable-zone(ch4page04k4)
// ✏️ Swap event handler.
//#-end-localizable-zone
tool1.onTouchMoved = addAlien(touch:)
scene.tools.append(tool1)

//#-localizable-zone(ch4page04k5)
// Create Tool 2.
//#-end-localizable-zone
let tool2 = Tool(name: "/*#-localizable-zone(tool2)*/Tool 2/*#-end-localizable-zone*/", emojiIcon: "2️⃣")
//#-localizable-zone(ch4page04k6)
// ✏️ Swap event handler.
//#-end-localizable-zone
tool2.onGraphicTouched = fattenAlien(graphic:)
scene.tools.append(tool2)
//#-end-editable-code
//#-hidden-code


playgroundEpilogue()

//#-end-hidden-code
