//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Loop repeatedly through images from an array.
 
 Instead of just a ⭐️ image, you can use an array of images with the tool—for example, `animals`. Look at the code in the `addImage` function below: Notice that it gets an image from `animals` at `index`, and then [increments](glossary://increment) `index` to point to the next image in the array.
 
 * callout(Using an index to get an image from an array):
    `let chosenImage = animals[index]`\
    `index += 1`
 
 1. Run the code, select the **Image** tool, and touch and drag across the scene. As you drag, `addImage(touch:)` is called repeatedly, and the images in the array are placed one after another.
 
    Imagine what the problem is with this—you might already have come across it! Yes, you’ll soon run out of images in the array, triggering an [index out of range error](glossary://index%20out%20of%20range%20error) when `index` goes past the end of the array.
 
 2. Solve the problem by adding code to set `index` back to zero if it reaches the end of the array.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, orbit(x:y:period:))
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
        var numberOfGraphics = 0
        var previousImage: Image?
        
        for event in assessmentInfo.events {
            if case .placeAt(let graphic, _) = event, let image = graphic.image  {
                
                if previousImage != nil && image == previousImage {
                    return false
                }
                
                previousImage = image
                numberOfGraphics += 1
                
                if numberOfGraphics > 6 {
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
    scene.shouldHideTools = false
}

public typealias _ImageLiteralType = Image

playgroundPrologue()

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheGreenFrontier@2x.png")
//#-end-hidden-code
let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]
var index = 0

func addImage(touch: Touch) {
    if touch.previousPlaceDistance < /*#-editable-code*/80/*#-end-editable-code*/ { return }
    
    //#-editable-code
    let chosenImage = animals[index]
    index += 1
//#-localizable-zone(ch2page04k1)
    // ✏️ Reset index if it’s reached the end of the array.
//#-end-localizable-zone
    
    //#-end-editable-code
    let graphic = Graphic(image: chosenImage)
    scene.place(graphic, at: touch.position)
}
//#-hidden-code
assessmentController?.customInfo["images"] = animals

let createImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
createImageTool.onTouchMoved = addImage
scene.tools.append(createImageTool)

playgroundEpilogue()

//#-end-hidden-code
