//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Insert planet Rugbyball and remove planet Billiardball.
 
 Breaking news: Planet Rugbyball 🏉 has been kicked into orbit just beyond planet Soccerball ⚽️, and planet Billiardball 🎱 has just been pocketed in a black hole. You need to update the scene!

 You use the `insert(_:at:)` method to add an item to an array at a specific [index](glossary://index). Any items after it move up one position, and the array’s `count` increases by 1.
 
 * callout(Inserting an item into an array):
    `images.insert(🌝, at: 2)`
 
 The `remove(at:)` method removes an item at an index. Any items that were after it move down one position, and the `count` decreases by 1.
 
 * callout(Removing an item from an array):
    `images.remove(at: 2)`
 
  The `planets` array is a [variable](glossary://variable), so you can change it.
 
 1. Add code to insert `rugbyBall` 🏉 into `images`, just after planet Soccerball ⚽️ and before planet Tennisball 🎾.
 
 2. Add code to remove planet Billiardball 🎱.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), x, y, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count)
//#-code-completion(identifier, hide, PageAssessment, playgroundPrologue(), playgroundEpilogue(), Touch, Color, Scene, _ImageLiteralType, correctArray)
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
        
        if let correctArray = assessmentInfo["correctArray"] as? [Image],
            let imagesArray = assessmentInfo["imagesArray"] as? [Image] {
            if imagesArray == correctArray {
                return true
            }
        }
        
        return false
    }
}



public func playgroundPrologue() {
    scene.shouldHideTools = true
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
//#-hidden-code
var correctArray = images
//#-end-hidden-code
let rugbyBall = #imageLiteral(resourceName: "rugbyball@2x.png")

var position = theOrigin
//#-editable-code
//#-localizable-zone(ch1page5k1)
// ✏️ Insert and remove items.
//#-end-localizable-zone

//#-localizable-zone(ch1page5k2)
// Place images.
//#-end-localizable-zone
for image in images {
    var graphic = Graphic(image: image)
    position.x += 75
    position.y += 75
    scene.place(graphic, at: position)
}
//#-end-editable-code
//#-hidden-code
correctArray.insert(rugbyBall, at: 1)
correctArray.remove(at: 4)

assessmentController?.customInfo["correctArray"] = correctArray
assessmentController?.customInfo["imagesArray"] = images

playgroundEpilogue()

scene.tools = [Tool]()  // Remove default tools

//#-end-hidden-code
