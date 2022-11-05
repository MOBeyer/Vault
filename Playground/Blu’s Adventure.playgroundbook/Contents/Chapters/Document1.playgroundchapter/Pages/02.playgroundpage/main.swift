//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Set a background image for the scene.
 
 Think of the scene as a bit like a scene in a movie, with graphics as actors. And just like in a movie, a scene can have a background. You can set a background image for the scene.

 * callout(Setting the background image):
    `scene.backgroundImage = 🌃`
 
 1. Write `scene.backgroundImage =` in the code, and then choose ![Image Symbol](ImageSymbol@2x.png) from the shortcut bar.
 2. Choose an image for your background.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, image)
//#-code-completion(identifier, show, scene, ., backgroundColor, backgroundImage, =)
//#-code-completion(identifier, hide, PageAssessment, playgroundPrologue(), playgroundEpilogue(), Touch, Color, Scene, _ImageLiteralType, starryNight)

import UIKit
import CoreGraphics

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {
    
    // Custom per-page evaluation to determine pass/fail assessment.
    // Return `true` to mark the page as successful.
    var backgroundNotEmpty = false
    
    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        
        var backgroundImageCount = 0
        
        for event in assessmentInfo.events {
            if case .setSceneBackgroundImage(let image) = event {
                if image?.isEmpty == false {
                    backgroundImageCount += 1
                    if backgroundImageCount > 1 {
                        return true
                    }
                }
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
//#-editable-code
//#-localizable-zone(ch1page02k1)
// ✏️ Set the background image.
//#-end-localizable-zone

//#-end-editable-code

let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let star = Graphic(image: #imageLiteral(resourceName: "Star@2x.png"))

scene.place(blu, at: Point(x: -250, y: 250))

let position = Point(x: /*#-editable-code*/250/*#-end-editable-code*/, y: /*#-editable-code*/250/*#-end-editable-code*/)
scene.place(star, at: position)

//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
