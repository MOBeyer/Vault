//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Place an array of planets in the universe.
 
 Instead of placing images one at a time, you can put them all in an [array](glossary://array), like these sporty planets:
 
 * callout(Array of images):
    `var images = [⚽️, 🎾, ⚾️, 🎱, 🏀]`
 
 Then you can [iterate](glossary://iteration) through the `images` array using a [for loop](glossary://for%20loop), creating a graphic with each image in turn, and placing it on the scene:
 
 * callout(Placing an array of images on the scene):
    `for image in images {`\
    `   // Create a graphic with image.`\
    `   // Place the graphic on the scene.`\
    `}`
 
 Place the planets in a diagonal line, starting near the origin at `position` (x = 75, y = 75), and going up and to the right. Write code to go inside the `for` loop:
 
 1. Create a graphic with `image`.
 2. Place the graphic on the scene at `position`.
 3. Move `position` up and to the right, by adding the same amount to its x and y coordinates:
 
    `position.x += 75`\
    `position.y += 75`
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, let, var, for, while, func, if, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), =, ==, +=, -=, +, -, *, /, randomDouble(from:to:), x, y, scale)
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
        var numberOfGraphics = 0
        var positionsX = Set<Double>()
        var positionsY = Set<Double>()
        
        for event in assessmentInfo.events {
            if case .placeAt(let graphic, let position) = event {
                numberOfGraphics += 1
                positionsX.insert(position.x)
                positionsY.insert(position.y)
            }
        }
        
        return numberOfGraphics == 6 && positionsX.count == 6 && positionsY.count == 6
    }
}



public func playgroundPrologue() {
    scene.useOverlay(overlay: .gridWithCoordinates)
    registerEvaluator(PageAssessment(), style: .discrete)
}


public func playgroundEpilogue() {
    performAssessment()
}

public typealias _ImageLiteralType = Image

playgroundPrologue()

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")
//#-end-hidden-code
let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

var images = [#imageLiteral(resourceName: "soccerball@2x.png"), #imageLiteral(resourceName: "tennisball@2x.png"), #imageLiteral(resourceName: "baseball@2x.png"), #imageLiteral(resourceName: "billiardball@2x.png"), #imageLiteral(resourceName: "basketball@2x.png")]

var position = Point(x: 75, y: 75)

//#-editable-code
for image in images {
//#-localizable-zone(ch1page4k1)
    // ✏️ Create a graphic with image.
//#-end-localizable-zone
    
//#-localizable-zone(ch1page4k2)
    // ✏️ Place graphic on the scene.
//#-end-localizable-zone
    
//#-localizable-zone(ch1page4k3)
    // ✏️ Set position for next graphic.
//#-end-localizable-zone
    
}
//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code

