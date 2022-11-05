//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Place a graphic in each quadrant of the universe.
 
 The coordinate system is divided by the x and y axes into four quarters, or *quadrants*, with the *origin* at the center. The coordinates in each quadrant have a different combination of positive and negative x, y values:
 
 ![Quadrants](quadrants@2x.png)
 
 Liven up Blu’s universe with a few alien creatures, like the ones defined as graphics in the code.
 
 1. Place one graphic in each quadrant of the universe.
 2. Run your code and make sure the graphics end up where you expect.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, scene, ., let, var, backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, x, y, place(_:at:), =, ==, +=, -=, +, -, *, /)
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
        
        let topRightQuad = CGRect(x: -1, y: -1, width: 501, height: 501)
        let topLeftQuad = CGRect(x: -501, y: -1, width: 501, height: 501)
        let bottomRightQuad = CGRect(x: -1, y: -501, width: 501, height: 501)
        let bottomLeftQuad = CGRect(x: -501, y: -501, width: 501, height: 501)
        
        let quads = [topRightQuad, topLeftQuad, bottomRightQuad, bottomLeftQuad]
        
        var points = [Point]()
        for event in assessmentInfo.events {
            if case .placeAt(_, let point) = event {
                points.append(point)
            }
        }
        
        let topRightCount = points.filter { topRightQuad.contains(CGPoint($0)) }.count
        let topLeftCount = points.filter { topLeftQuad.contains(CGPoint($0)) }.count
        let bottomRightCount = points.filter { bottomRightQuad.contains(CGPoint($0)) }.count
        let bottomLeftCount = points.filter { bottomLeftQuad.contains(CGPoint($0)) }.count
        return topRightCount == 2 && topLeftCount == 1 && bottomRightCount == 1 && bottomLeftCount == 1
        
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

let ghost = Graphic(image: #imageLiteral(resourceName: "ghost@2x.png"))
let alien = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
let ogre = Graphic(image: #imageLiteral(resourceName: "ogre@2x.png"))
let monster = Graphic(image: #imageLiteral(resourceName: "monster@2x.png"))

let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

//#-editable-code
//#-localizable-zone(ch1page03k1)
// ✏️ Place a graphic in each quadrant.
//#-end-localizable-zone
scene.place(ghost, at: Point(x: 250, y: 250))

//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
