//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Add different tools to the toolbox.
 
 The code below has three “touch moved” event handler functions that do very different things. Notice that they all have the same `Touch` parameter. Each time a “touch moved” event occurs, the event handler is called with a `Touch` instance containing information about that particular touch movement, such as:
 
 * `position`: Current touch position
 * `previousPlaceDistance`: Distance from the last placed graphic
 * `numberOfObjectsPlaced`: Number of graphics placed so far
 
 You can use these `Touch` properties in the event handler function. For example, `previousPlaceDistance` can be used to space out placed graphics.
 
 Add a tool for each of the event handler functions, `addFruit(touch:)`, `addSwirlingAlien(touch:)`, and `addGreeting(touch:)`.
 
 1. Create a tool, giving it a name and emoji icon.
 2. Set the tool’s “touch moved” event handler to the related function.
 3. Add the new tool to the scene’s tools.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, rotation)
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
        
        if sceneTools.count >= 3 {
            return true
        }
        
        return false
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
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheGreenFrontier@2x.png")
//#-end-hidden-code
//#-editable-code
func addFruit(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let fruit = "🍏🍐🍊🍋🍉🍒🍓🍌".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphic.scale = randomDouble(from: 0.5, to: 2.0)
}

func addSwirlingAlien(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let graphic = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
    scene.place(graphic, at: touch.position)
    graphic.swirlAway(after: 2.5)
}

func addGreeting(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let greetings = ["/*#-localizable-zone(ch4page03greeting1)*/howdy/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page03greeting2)*/hello/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page03greeting3)*/hi/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page03greeting4)*/g’day/*#-end-localizable-zone*/"]
    let greeting = greetings.randomItem
    let graphic = Graphic(text: greeting)
    graphic.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    graphic.fontName = .chalkduster
    scene.place(graphic, at: touch.position)
    graphic.rotation = randomDouble(from: -30.0, to: 30.0)
}

//#-localizable-zone(ch4page03k1)
// ✏️ Create and add Fruit tool.
//#-end-localizable-zone

//#-localizable-zone(ch4page03k2)
// ✏️ Create and add Alien tool.
//#-end-localizable-zone

//#-localizable-zone(ch4page03k3)
// ✏️ Create and add Greeting tool.
//#-end-localizable-zone

//#-end-editable-code
//#-hidden-code
assessmentController?.customInfo["tools"] = scene.tools
playgroundEpilogue()
    
//#-end-hidden-code
