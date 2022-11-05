//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Use your new skills with graphics and touch events to code your own cool project!
 
 See if you can write your own code for the `addImage` and `addText` functions.
 
 **Remember**: If you need to wipe the scene and start over again, just press the **Clear** button. You can even do this in code:
 
 * callout(Clearing the scene):
 `scene.clear()`
 
 When you’re finished with your project, move on to the [**next chapter**](@next).
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, %, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), rotation, move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), orbit(x:y:period:))
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
//#-localizable-zone(ch2page10k1)
// Clear the scene.
//#-end-localizable-zone
scene.clear()
//#-localizable-zone(ch2page10k2)
// Use your own background image.
//#-end-localizable-zone
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
//#-localizable-zone(ch2page10k3)
// Add your own code to set up the scene.
//#-end-localizable-zone

//#-localizable-zone(ch2page10k4)
// With the Image tool selected, this function is called each time you move your touch.
//#-end-localizable-zone
func addImage(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
    
//#-localizable-zone(ch2page10k5)
    // ✏️ Replace with your own code.
//#-end-localizable-zone
    let graphic = Graphic(image: #imageLiteral(resourceName: "ogre@2x.png"))
    graphic.scale = randomDouble(from: 2, to: 4)
    graphic.rotation = randomDouble(from: 0, to: 180)
    scene.place(graphic, at: touch.position)
    graphic.swirlAway(after: randomDouble(from: 1, to: 4))
}

let emoji = "😺🚗🎃🚕🤢🚙"
//#-localizable-zone(ch2page10k6)
// Split emoji into an array of single-character strings.
//#-end-localizable-zone
let characters = emoji.componentsByCharacter()
//#-localizable-zone(ch2page10k7)
// Index to next character.
//#-end-localizable-zone
var index = 0

//#-localizable-zone(ch2page10k8)
// With the Text tool selected, this function is called each time you move your touch.
//#-end-localizable-zone
func addText(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
    
//#-localizable-zone(ch2page10k9)
    // ✏️ Replace with your own code.
//#-end-localizable-zone
    let graphic = Graphic(text: characters[index])
    graphic.scale = 2.5
    scene.place(graphic, at: touch.position)
    graphic.fadeOut(after: randomDouble(from: 1, to: 4))
    
    index += 1
    if index == characters.count {
        index = 0
    }
}

//#-end-editable-code
//#-hidden-code

let createImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
createImageTool.onTouchMoved = addImage(touch:)
scene.tools.append(createImageTool)

let textTool = Tool(name: NSLocalizedString("Text", comment: "The name of the text tool"), emojiIcon: "😺")
textTool.onTouchMoved = addText(touch:)
scene.tools.append(textTool)

playgroundEpilogue()

//#-end-hidden-code
