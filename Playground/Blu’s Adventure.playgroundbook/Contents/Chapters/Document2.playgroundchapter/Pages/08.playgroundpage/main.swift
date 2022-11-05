//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Move images into patterns.
 
 When you place an image using the **Image** tool, it doesn’t have to stay where it is! You can use code to move it anywhere on the scene, and even animate it by telling it how long to take to get there.
 
 * callout(Animating a graphic to a position):
    `let position = Point(x: 100, y: 100)`\
    `graphic.move(to: position, duration: 1.0)`
 
 The scene has functions that return an array of points in different patterns.
 
 * callout(Get an array of points in a circle or spiral):
    `let points = scene.circlePoints(radius: 200, count: 200)`\
    `let points = scene.spiralPoints(spacing: 50, count: 200)`
 
 You can move the images to these points as you place them on the scene.
 
 1. In `addImage(touch:)`, after you place the graphic, add code to get the position at `points[pointIndex]`.
 
 2. Increment `pointIndex` so that it’s ready to get the next position. Add some code to set `pointIndex` back to zero if it goes out of [bounds](glossary://bounds).
 
 3. Move the graphic to the position using `graphic.move(to:duration:)`.
 
 4. Select the **Image** tool and touch and drag around the scene. Watch the images magically arrange themselves.
*/
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, %, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), orbit(x:y:period:), rotation)
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
        guard let placePoints: [Point] = assessmentInfo["points"] as? [Point] else { return nil }
        
        var index = 0
        for event in assessmentInfo.events {
            if case .moveTo(let graphic, let position) = event {
                if placePoints.count > index {
                    let point = placePoints[index]
                    if point.x != position.x && point.y != position.y {
                        return false
                    } else if index > 2 {
                        return true
                    }
                    index += 1
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

//#-editable-code
//#-localizable-zone(ch2page08k1)
// Get array of points in a pattern.
//#-end-localizable-zone
let points = scene.circlePoints(radius: 200, count: 100)
//#-localizable-zone(ch2page08k2)
// Index to points.
//#-end-localizable-zone
var pointIndex = 0
//#-end-editable-code

func addImage(touch: Touch) {
    if touch.previousPlaceDistance < /*#-editable-code*/80/*#-end-editable-code*/ { return }
        
    //#-editable-code
//#-localizable-zone(ch2page08k3)
    // Get a random image and place it.
//#-end-localizable-zone
    let index = randomInt(from: 0, to: animals.count - 1)
    var graphic = Graphic(image: animals[index])
    graphic.scale = 0.5
    scene.place(graphic, at: touch.position)
//#-localizable-zone(ch2page08k4)
    // ✏️ Get position from points at pointIndex.
//#-end-localizable-zone
    
//#-localizable-zone(ch2page08k5)
    // ✏️ Increment pointIndex.
//#-end-localizable-zone
    
//#-localizable-zone(ch2page08k6)
    // ✏️ Move graphic to position.
//#-end-localizable-zone
    
    //#-end-editable-code
    //#-hidden-code
    assessmentController?.customInfo["points"] = points
    //#-end-hidden-code
}
//#-hidden-code

let createImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
createImageTool.onTouchMoved = addImage
scene.tools.append(createImageTool)

playgroundEpilogue()

//#-end-hidden-code
