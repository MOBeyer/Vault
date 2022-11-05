//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Build something amazing—you decide!
 
 Bring your creative and coding skills together to come up with a cool new idea. Code it right here, and surprise yourself and your friends.
 
 When you’re finished with your creation, [continue your coding journey](playgrounds://featured).
 */
//#-hidden-code
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)

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
//#-end-hidden-code
//#-editable-code
scene.clear()
//#-localizable-zone(ch5page05k1)
// Use your own background image.
//#-end-localizable-zone
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
//#-localizable-zone(ch5page05k2)
// Add your own code to set up the scene.
//#-end-localizable-zone

func doSomething(touch: Touch) {

}

func doSomethingTo(graphic: Graphic) {

}

func buttonPressed() {

}

//#-localizable-zone(ch5page05k3)
// Change the tools or add new tools.
//#-end-localizable-zone
let tool1 = Tool(name: "/*#-localizable-zone(p05tool1)*/Tool 1/*#-end-localizable-zone*/", emojiIcon: "1️⃣")
tool1.onTouchMoved = doSomething(touch:)
scene.tools.append(tool1)

let tool2 = Tool(name: "/*#-localizable-zone(p05tool2)*/Tool 2/*#-end-localizable-zone*/", emojiIcon: "2️⃣")
tool2.onGraphicTouched = doSomethingTo(graphic:)
scene.tools.append(tool2)

//#-localizable-zone(ch5page05k4)
// Change the button name.
//#-end-localizable-zone
let button = Button(name: "/*#-localizable-zone(ch5page05button)*/Button/*#-end-localizable-zone*/")
button.onPress = buttonPressed
scene.button = button
//#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
