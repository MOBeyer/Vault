//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Space out the stars on the scene.
 
 Choose the **Image** tool and touch and drag very slowly across the scene. You might notice a bit of a problem: Instead of individual stars, you get a jagged yellow line.
 
 Code sometimes has side effects that you don’t expect. In this case, when you drag very slowly, each touch event is very close to the previous one, and you end up with loads of stars packed together.
 
To add space between your stars, you can use conditional code with the `previousPlaceDistance` property of `touch`. Its value is the distance your touch has moved since the last graphic was placed on the scene.
 
 * callout(Return if touch hasn’t moved far enough):
    `if touch.previousPlaceDistance < 80 {`\
    `   return`\
    `}`
 
When `return` is called, the function ends immediately and *returns* to the code that called it.
 
Try changing the distance being compared to `touch.previousPlaceDistance`, and see what effect it has on how the stars are placed.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(bookauxiliarymodule, show)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), orbit(x:y:period:))
//#-code-completion(identifier, hide, PageAssessment, playgroundPrologue(), playgroundEpilogue(), Touch, Color, Scene, _ImageLiteralType)
//#-code-completion(description, show, "[Int]")

import UIKit
import PlaygroundSupport
import Foundation
import CoreGraphics

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {
    
    func extractedNumericValue(from string: String) -> Float? {
        let numericCharacterSet = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: "."))
        let s = String(string.unicodeScalars.filter { numericCharacterSet.contains($0) })
        return Float(s)
    }
    
    // Custom per-page evaluation to determine pass/fail assessment.
    // Return `true` to mark the page as successful.
    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        guard assessmentInfo.events.count >= 2 else { return nil }
        
        let checker = ContentsChecker(contents: PlaygroundPage.current.text)
        
        let conditionalStatements = checker.conditionalNodes.map { $0.condition }
        
        for statement in conditionalStatements where statement.contains("<") {
            
            if let expression = statement.components(separatedBy: "<").last {
                if let distance = extractedNumericValue(from: expression), distance > 10.0 {
                    return true
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
    scene.includeSystemTools = false
    scene.shouldHideTools = false
}

public typealias _ImageLiteralType = Image

playgroundPrologue()

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheGreenFrontier@2x.png")
//#-end-hidden-code
func addImage(touch: Touch) {
    if touch.previousPlaceDistance < /*#-editable-code*/10/*#-end-editable-code*/ {
        return
    }
    
    let graphic = Graphic(image: /*#-editable-code*/#imageLiteral(resourceName: "Star@2x.png")/*#-end-editable-code*/)
    scene.place(graphic, at: touch.position)
}
//#-hidden-code
let addImageTool = Tool(name: NSLocalizedString("Image", comment: "The name of the image tool"), emojiIcon: "🖼")
addImageTool.onTouchMoved = addImage
scene.tools = [addImageTool] // Just the image tool

playgroundEpilogue()

//#-end-hidden-code
