//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Experiment:** Move and delete stars on the scene.
 
 A toolbox with just one tool in it is great, but a bit boring! You’ll fix that soon, but first run the code. You’ll find two new tools: **Move** and **Erase**.
 
 **Move** and **Erase** behave differently from the **Image** tool. Instead of adding new graphics, they do something to graphics that are already on the scene—and you can probably guess what they do!
 
 1. Select the **Image** tool and add a few stars to the scene.
 2. Now select the **Move** tool and drag one of the stars to a new location.
 3. Select the **Erase** tool and touch one of the stars.
 
 When you’ve finished rearranging the universe, move on to the [**next page**](@next).
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), orbit(x:y:period:))
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
func addImage(touch: Touch) {
    if touch.previousPlaceDistance < /*#-editable-code*/80/*#-end-editable-code*/ {
        return
    }
    
    let graphic = Graphic(image: /*#-editable-code*/#imageLiteral(resourceName: "Star@2x.png")/*#-end-editable-code*/)
    scene.place(graphic, at: touch.position)
}
//#-hidden-code
var tools: [Tool] = []

let addImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
addImageTool.onTouchMoved = addImage
tools.append(addImageTool)

scene.tools = tools

playgroundEpilogue()

//#-end-hidden-code
