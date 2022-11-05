//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Place captions on the scene under the graphics.
 
 In code, if you want to use some text, just wrap the words or characters in double quotes and you have a [string](glossary://String).
 
 * callout(Example of a string):
    `"Blu blew blue bubbles."`
 
 If you name a string by defining it as a [constant](glossary://constant), it’s handier to use in your code.
 
 * callout(Creating a string constant):
    `let greeting = "Hello Blu!"`

 Once you have a string, you can create a graphic with it, just as you would with an image.
 
 * callout(Creating a text graphic):
    `let graphic = Graphic(text: greeting)`
 
 And you can then place the text graphic anywhere on the scene.
 
 * callout(Placing a text graphic):
    `scene.place(graphic, at: Point(x: 100, y: 300))`
 
 Run the code. You’ll see the residents of Blu’s universe lurking—one in each quadrant. Your job is to place the missing captions below the ogre 👹 and the monster 👾.
 
 1. Create a `Graphic` instance with each caption.
 2. Place each graphic on the scene using a `Point` instance for the x, y coordinates.
*/
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, orbit(x:y:period:), rotation)
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
        var textPlaced = 0
        for event in assessmentInfo.events {
            if case .placeAt(let graphic, let position) = event {
                // Only count placement of graphics with text.
                if graphic.text != "" {
                    textPlaced += 1
                }
            }
        }
        
        if textPlaced > 3 {
            return true
        }
        return false
    }
}



public func playgroundPrologue() {
    scene.useOverlay(overlay: .gridWithCoordinates)
    registerEvaluator(PageAssessment(), style: .discrete)
}


public func playgroundEpilogue() {
    performAssessment()
    scene.includeSystemTools = false
    scene.shouldHideTools = true
}

public typealias _ImageLiteralType = Image

playgroundPrologue()

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")
//#-end-hidden-code
//#-editable-code
//#-localizable-zone(ch1page03ak1)
// ✏️ Captions. Add your own!
//#-end-localizable-zone
let caption1 = "/*#-localizable-zone(ooowheeeee)*/Ooowheeeee/*#-end-localizable-zone*/"
let caption2 = "/*#-localizable-zone(blurp)*/Blurp! Gloink splok./*#-end-localizable-zone*/"
let caption3 = "/*#-localizable-zone(hairyogre)*/Hairy Ogre/*#-end-localizable-zone*/"
let caption4 = "/*#-localizable-zone(imfriendly)*/I’m friendly!/*#-end-localizable-zone*/"

//#-localizable-zone(ch1page03ak2)
// Add captions to the scene.
//#-end-localizable-zone
let graphic1 = Graphic(text: caption1)
scene.place(graphic1, at: Point(x: -250, y: 310))
let graphic2 = Graphic(text: caption2)
scene.place(graphic2, at: Point(x: 200, y: 160))
//#-localizable-zone(ch1page03ak3)
// ✏️ Add the rest of the captions.
//#-end-localizable-zone

//#-end-editable-code
//#-hidden-code

let ghost = Graphic(image: #imageLiteral(resourceName: "ghost@2x.png"))
let alien = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
let ogre = Graphic(image: #imageLiteral(resourceName: "ogre@2x.png"))
let monster = Graphic(image: #imageLiteral(resourceName: "monster@2x.png"))

scene.place(ghost, at: Point(x: -250, y: 400))
scene.place(alien, at: Point(x: 200, y: 250))
scene.place(ogre, at: Point(x: 250, y: -200))
scene.place(monster, at: Point(x: -350, y: -250))

ghost.scale = 2.5
alien.scale = 2.5
ogre.scale = 2.5
monster.scale = 2.5

var tools: [Tool] = []
scene.tools = tools

playgroundEpilogue()

//#-end-hidden-code

