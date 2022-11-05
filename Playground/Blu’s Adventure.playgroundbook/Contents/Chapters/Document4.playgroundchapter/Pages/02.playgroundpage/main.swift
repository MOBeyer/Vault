//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Create a tool to connect an event with an event handler.
 
 To create a new tool, you initialize an instance of type `Tool` with a name and icon.
 
 * callout(Initializing a tool):
 `let alienTool = Tool(name: "Alien", emojiIcon: "👽")`

 Your tool responds to an event, such as a touch or drag, by calling an [event handler](glossary://event%20handler) function.
 
 * callout(Function to handle a “touch moved” event):
    `func addAlien(touch: Touch) {`\
    `   // Place an alien at touch position`\
    `}`
 
To connect your event handler to “touch moved” events, set your tool’s `onTouchMoved` property to the [full function name](glossary://full%20function%20name) of the event handler. To add your tool to the scene, [append](glossary://append) it to the `scene.tools` array.
 
 * callout(Example):
    `let alienTool = Tool(name: "Alien", emojiIcon: "👽")`\
    `alienTool.onTouchMoved = addAlien(touch:)`\
    `scene.tools.append(alienTool)`
 
 1. Initialize a new tool with a name and emoji icon.
 2. Set the tool’s “touch moved” event handler to `addAlien(touch:)`.
 3. Add your new tool to the scene’s tools.
*/
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, rotation)
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
        guard let sceneTools = assessmentInfo["tools"] as? [Tool] else { return nil }
        var placeCount = 0
        
        for event in assessmentInfo.events {
            if case.placeAt(_, _) = event {
                placeCount += 1
            }
        }
        if sceneTools.count >= 1 && placeCount > 2 {
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
//#-localizable-zone(ch4page02k1)
// Event handler for “touch moved” events.
//#-end-localizable-zone
func addAlien(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let graphic = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
    scene.place(graphic, at: touch.position)
}

//#-localizable-zone(ch4page02k2)
// ✏️ Create a tool.
//#-end-localizable-zone

//#-localizable-zone(ch4page02k3)
// ✏️ Connect event handler to the tool.
//#-end-localizable-zone

//#-localizable-zone(ch4page02k4)
// ✏️ Add tool to scene’s tools.
//#-end-localizable-zone

//#-end-editable-code
//#-hidden-code
assessmentController?.customInfo["tools"] = scene.tools
playgroundEpilogue()

//#-end-hidden-code
