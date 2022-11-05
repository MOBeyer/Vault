//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Experiment:** Play with fading images.
 
  When you use the **Image** tool for a while, the scene quickly gets a bit cluttered! You can avoid this—and create some cool effects—by coding the graphics to disappear after a while in a variety of ways.
 
 Fade out:
 
 * callout(Fade out after a random number of seconds):
    `let seconds = randomDouble(from: 1.0, to: 5.0)`\
    `graphic.fadeOut(after: seconds)`
 
 Pop:
 
 * callout(Spin and pop after a number of seconds):
    `graphic.spinAndPop(after: seconds)`
 
 Swirl away:

 * callout(Swirl away after a number of seconds):
    `graphic.swirlAway(after: seconds)`
 
 To make things more interesting, you can code specific behavior for certain images.
 
 * callout(Pop the pandas):
    `if index == 2 {`\
    `   graphic.spinAndPop(after: seconds)`\
    `}`
 
 1. Use these functions to create interesting patterns and effects as you touch and drag around the scene.
 
 2. Experiment with different effects for specific images.
 
 When you’re finished, move on to the [**next page**](@next).
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, %, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), orbit(x:y:period:), rotation)
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
let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]
//#-end-editable-code

func addImage(touch: Touch) {
    if touch.previousPlaceDistance < /*#-editable-code*/80/*#-end-editable-code*/ { return }
        
    //#-editable-code
//#-localizable-zone(ch2page07k1)
    // Get a random image and place it.
//#-end-localizable-zone
    let index = randomInt(from: 0, to: animals.count - 1)
    var graphic = Graphic(image: animals[index])
    scene.place(graphic, at: touch.position)
    
    let seconds = randomDouble(from: 1.0, to: 5.0)
//#-localizable-zone(ch2page07k2)
    // ✏️ Experiment with different functions.
//#-end-localizable-zone
    graphic.fadeOut(after: seconds)
    //#-end-editable-code
}
//#-hidden-code

let createImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
createImageTool.onTouchMoved = addImage
scene.tools.append(createImageTool)

playgroundEpilogue()

//#-end-hidden-code
