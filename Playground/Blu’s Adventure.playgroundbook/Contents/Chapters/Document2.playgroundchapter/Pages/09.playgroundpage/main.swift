//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Arrange images in symmetrical patterns.
 
 You can place several images on the scene at once, to make cool, kaleidoscope-like patterns, by finishing the code in the `addImage` function. Each time you place an image at your touch position in one quadrant of the scene, place three more in mirror-image positions in the other three quadrants.
 
 To work out the positions of the images, start with the [absolute](glossary://absolute%20value) value of the x and y touch coordinates. The symmetrical positions in the four quadrants are then top right: **(x, y)**; bottom right: **(x, -y)**; bottom left: **(-x, -y)**; top left: **(-x, y)**.
 
 The code below creates four `Graphic` instances, each with the same random animal image, and puts them into the `graphics` array.
 
 Place one graphic from the `graphics` array in each quadrant of the scene. The `abs` function gets the absolute x and y values; use them to get the x and y coordinates for each quadrant.
 
 **Ideas:**
 
 * Set `scale` and `rotation` for each graphic to a random `Double` value.
 
 * Have each graphic gradually disappear after it’s been placed, by calling one of these graphic methods: `fadeOut(after:)`, `spinAndPop(after:)`, `swirlAway(after:)`.
 
 * Instead of just placing each graphic at its final position, first place it at `touch.position` and then use `move(to:duration:)` to animate it into place.
 
 When you’re finished, move on to the [**next page**](@next).
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

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
//#-end-hidden-code
//#-editable-code
let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]
//#-end-editable-code

var lastPlacePosition = Point(x: 0, y: 0)

func addImage(touch: Touch) {
    
    //#-editable-code
//#-localizable-zone(ch2page09k1)
    // Space out the graphics.
//#-end-localizable-zone
    let placeDistance = touch.position.distance(from: lastPlacePosition)
    if placeDistance < 80 { return }
    lastPlacePosition = touch.position
    
//#-localizable-zone(ch2page09k2)
    // Graphics for each quadrant.
//#-end-localizable-zone
    var graphics: [Graphic] = []
//#-localizable-zone(ch2page09k3)
    // Pick a random image.
//#-end-localizable-zone
    let chosenImage = animals.randomItem
//#-localizable-zone(ch2page09k4)
    // Create graphics and add to array.
//#-end-localizable-zone
    for i in 0 ..< 4 {
        let graphic = Graphic(image: chosenImage)
        graphics.append(graphic)
    }
//#-localizable-zone(ch2page09k5)
    // Get absolute x, y values.
//#-end-localizable-zone
    let x = abs(touch.position.x)
    let y = abs(touch.position.y)
//#-localizable-zone(ch2page09k6)
    // Position a graphic in each quadrant.
//#-end-localizable-zone
    
    //#-end-editable-code
}
//#-hidden-code

let createImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
createImageTool.onTouchMoved = addImage
scene.tools.append(createImageTool)

playgroundEpilogue()

//#-end-hidden-code
