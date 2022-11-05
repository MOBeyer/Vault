//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Place random images from an array onto the scene.
 
 Instead of looping through an array, you can place random images from it onto the scene. Use the `randomInt(from:to:)` function, which returns a random integer between two numbers. If those numbers are 0 and the array count minus 1, `randomInt` returns a random index to an item in the array.
 
 * callout(Get a random animal image):
    `let index = randomInt(from: 0, to: animals.count - 1)`\
    `let graphic = Graphic(image: animals[index])`
 
 For variety, you can scale or rotate a graphic to a random value.
 
  * callout(Apply a random scale or rotation):
    `graphic.scale = randomDouble(from: 0.5, to: 2.0)`\
    `graphic.rotation = randomDouble(from: 0.0, to: 360.0)`
 
 1. In `addImage(touch:)`, set `index` so that a random image is placed each time the function is called.
 2. After placing the graphic, set its `scale` and `rotation` to random values.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, %, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, rotation, orbit(x:y:period:))
//#-code-completion(identifier, hide, PageAssessment, playgroundPrologue(), playgroundEpilogue(), Touch, Color, Scene, _ImageLiteralType)
//#-code-completion(description, show, "[Int]")

import UIKit
import PlaygroundSupport
import CoreGraphics

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {
    
    // Custom per-page evaluation to determine pass/fail assessment.
    // Return `true` to mark the page as successful.
    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        
        // Check for randomInt call.
        let checker = ContentsChecker(contents: PlaygroundPage.current.text)
        guard checker.functionCallCount(forName: "randomInt") > 0 else { return false }
        
        let placeEventsLimit = 50 // Limit the number of events that are evaluated.
        var placeEventsCount = 0
        
        var firstImage: Image?
        for event in assessmentInfo.events {
            if case .placeAt(let graphic, _) = event, let image = graphic.image {
                guard placeEventsCount < placeEventsLimit else { return false }
                placeEventsCount += 1
                if firstImage == nil {
                    firstImage = image
                } else if image != firstImage {
                    // A different image has been placed, so now check for scale or rotation.
                    if graphic.scale != 1.0 || graphic.rotation != 0 {
                        return true
                    }
                }
            }
        }
        
        return false
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
let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]
//#-end-editable-code

func addImage(touch: Touch) {
    if touch.previousPlaceDistance < /*#-editable-code*/80/*#-end-editable-code*/ { return }
        
    //#-editable-code
//#-localizable-zone(ch2page06k1)
    // ✏️ Set index to a random value.
//#-end-localizable-zone
    let index = 0
    var graphic = Graphic(image: animals[index])
    scene.place(graphic, at: touch.position)
//#-localizable-zone(ch2page06k2)
    // ✏️ Scale or rotate graphic (or do both).
//#-end-localizable-zone
    
    //#-end-editable-code
}
//#-hidden-code

let createImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
createImageTool.onTouchMoved = addImage
scene.tools.append(createImageTool)

playgroundEpilogue()

//#-end-hidden-code
