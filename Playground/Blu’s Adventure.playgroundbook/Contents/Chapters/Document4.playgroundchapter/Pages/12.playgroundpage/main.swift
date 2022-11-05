//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Use your new skills with event handlers to code your own cool project!
 
 When you’re finished with your project, move on to the [**next chapter**](@next).
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, %, "", !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, alpha, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, moveAndZap(to:), moveAndRemove(to:duration:), playSound(_:), playSound(_:volume:), playInstrument(_:note:), playInstrument(_:note:volume:), text, electricGuitar, bassGuitar, cosmicDrums, piano, bark, bluDance, bluLookAround, bluHeadScratch, bluOops, data, electricity, hat, knock, phone, pop, snare, tennis, tick, walrus, warp, rotation)
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
//#-localizable-zone(ch4page12k1)
// Use your own background image.
//#-end-localizable-zone
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
//#-localizable-zone(ch4page12k2)
// Add your own code to set up the scene.
//#-end-localizable-zone

//#-localizable-zone(ch4page12k3)
// With the Balloon tool selected, this function is called each time you move your touch.
//#-end-localizable-zone
func addBalloon(touch: Touch) {
    if touch.previousPlaceDistance < 100 { return }
    
    //#-localizable-zone(ch4page12k4)
    // Replace with your own code.
    //#-end-localizable-zone
    let graphic = Graphic(text: "🎈")
    graphic.scale = randomDouble(from: 4, to: 8)
    scene.place(graphic, at: touch.position)
}

//#-localizable-zone(ch4page12k5)
// With the Pop tool selected, this function is called when you touch a graphic.
//#-end-localizable-zone
func popBalloon(graphic: Graphic) {
    //#-localizable-zone(ch4page12k6)
    // Replace with your own code.
    //#-end-localizable-zone
    graphic.fadeOut(after: 1)
    playSound(.pop)
}

//#-localizable-zone(ch4page12k7)
// This function is called when you press the Go button.
//#-end-localizable-zone
func go() {
    //#-localizable-zone(ch4page12k8)
    // Replace with your own code.
    //#-end-localizable-zone
    for graphic in scene.graphics {
        graphic.rotation = randomDouble(from: -45, to: 45)
        graphic.scale = randomDouble(from: 4, to: 8)
    }
}

//#-localizable-zone(ch4page12k9)
// Change the tools or add new tools.
//#-end-localizable-zone
let balloonTool = Tool(name: "/*#-localizable-zone(ch4page12balloonTool)*/Balloon/*#-end-localizable-zone*/", emojiIcon: "🎈")
balloonTool.onTouchMoved = addBalloon
scene.tools.append(balloonTool)

let popTool = Tool(name: "/*#-localizable-zone(ch4page12popTool)*/Pop/*#-end-localizable-zone*/", emojiIcon: "📌")
popTool.onGraphicTouched = popBalloon(graphic:)
scene.tools.append(popTool)

//#-localizable-zone(ch4page12k10)
// Change the button.
//#-end-localizable-zone
let button = Button(name: "/*#-localizable-zone(ch4page12goButton)*/Go/*#-end-localizable-zone*/")
button.onPress = go
scene.button = button
//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
