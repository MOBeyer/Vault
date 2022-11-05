//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Move the star closer to the galaxy.
 
 Blu’s universe has one very simple rule: The only things allowed in it are [instances](glossary://instance) of [type](glossary://type) `Graphic`. In fact, even Blu is really just an instance of `Graphic`.
 
 * callout(Blu is born):
    `let blu = Graphic(image: 💧)`
 
 In code, the universe is an instance of `Scene` called `scene`. The scene has a [coordinate](glossary://coordinates) system, and any position on it can be specified by a `Point` value. You can use the `place(_:at:)` method to place a graphic at a point on the scene.
 
 * callout(Placing Blu at home):
    `let theOrigin = Point(x: 0, y: 0)`\
    `scene.place(blu, at: theOrigin)`
 
 The code below creates a single star graphic and places it on the scene to light up Blu’s universe. 
 
 1. See if you can work out the x and y coordinates of a point close to the galaxy.
 2. Place the star at that point by changing the `x` and `y` values of `position` to those coordinates.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, PageAssessment, playgroundPrologue(), playgroundEpilogue(), Touch, Color, _ImageLiteralType, galaxy, blu, star, theOrigin)

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
        let region = CGRect(x: 150, y: 250, width: 220, height: 220)
        var points: [Point] = []
        
        for event in assessmentInfo.events {
            if case .placeAt(let graphic, let position) = event {
                points.append(position)
            }
        }
        let pointsInRegion = points.filter { region.contains(CGPoint($0)) }.count
        
        if pointsInRegion == 2 {
            return true
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
//#-hidden-code
var galaxy = Graphic(image: #imageLiteral(resourceName: "MilkyWay@2x.png") )
scene.place(galaxy, at: Point(x: 250, y: 350))
//#-end-hidden-code
let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let star = Graphic(image: #imageLiteral(resourceName: "Star@2x.png"))

let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

//#-editable-code
//#-localizable-zone(ch1page01k1)
// ✏️ Set the position of the star.
//#-end-localizable-zone
let position = Point(x: -250, y: 350)
scene.place(star, at: position)
//#-end-editable-code
//#-hidden-code


playgroundEpilogue()

//#-end-hidden-code
