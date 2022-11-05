//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Paint the universe with different images.
 
 Run the code, and you’ll notice an **Image** button in the top-left corner. This is your first tool, and it’s already selected. Touch and drag around the scene and paint the universe with stars. ⭐️⭐️⭐️
 
 As you touch and drag around the scene, a message is sent with your new position every time your touch moves—even the tiniest amount. These messages are touch [events](glossary://event), and there’s quite a stream of them, especially if you’re moving quickly!
 
 Whenever the **Image** tool is selected, `addImage(touch:)` is called for each touch event, and the code you put in it is called every time your touch moves. The `touch` parameter contains its position; if you create a new star graphic and place it on the scene at `touch.position`, new stars will appear.
 
 1. Touch and drag around the scene and create some interesting patterns. Use the **Clear** button to clear the scene and start over.
 2. Edit the code to create the graphic from a different image, such as a frog 🐸 or a purple monster 👾.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(module, show, Swift)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), orbit(x:y:period:))
//#-code-completion(identifier, hide, PageAssessment, playgroundPrologue(), playgroundEpilogue(), Touch, Color, Scene, _ImageLiteralType, isDifferentImage, starHash, starImage)


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
        
        guard let userChangedImage = assessmentInfo["isDifferentImage"] as? Bool else { return nil}
        
        if !userChangedImage {
            return false
        }
        
        var placedItems = 0
        
        for event in assessmentInfo.events {
            if case .placeAt(_,_) = event {
                placedItems += 1
                if placedItems > 3 {
                    return true
                }
            }
        }
        
        return nil
    }
}



public func playgroundPrologue() {
    registerEvaluator(PageAssessment(), style: .continuous)
}


public func playgroundEpilogue() {
    performAssessment()
    scene.includeSystemTools = false
    scene.shouldHideTools = false
}

public typealias _ImageLiteralType = Image

let starImage = #imageLiteral(resourceName: "Star@2x.png")
let starHash = starImage.hashValue
playgroundPrologue()

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheGreenFrontier@2x.png")
//#-end-hidden-code
func addImage(touch: Touch) {
    let graphic = Graphic(image: /*#-editable-code*/#imageLiteral(resourceName: "Star@2x.png")/*#-end-editable-code*/)
    //#-hidden-code
    var isDifferentImage = false
    if let userImage = graphic.image {
        if starHash != userImage.hashValue {
            isDifferentImage = true
        }
    }
    assessmentController?.customInfo["isDifferentImage"] = isDifferentImage
    //#-end-hidden-code
    scene.place(graphic, at: touch.position)
}
//#-hidden-code
let addImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
addImageTool.onTouchMoved = addImage
scene.tools = [addImageTool]  // Just the image tool

playgroundEpilogue()

//#-end-hidden-code
