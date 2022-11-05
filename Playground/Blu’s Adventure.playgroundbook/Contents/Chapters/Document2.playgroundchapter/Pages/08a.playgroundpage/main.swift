//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Use the **Text** tool to place text on the scene.
 
 Run the code, and you’ll notice a new **Text** tool. You can use this tool to place text on the scene.
 
 With the **Text** tool selected, `addText(touch:)` is called as you touch and drag across the scene. If you drag far enough, a new `Graphic` instance is created with the text, and placed on the scene.

 1. In the `addText` function, change `name`, and perhaps the [font](glossary://font). Now run the code, choose the **Text** tool, and touch and drag around the scene.
 
 2. Instead of `name`, use the item at `index` in the `things` array (`things[index]`).
 
 3. Set `graphic.textColor` to the item at `index` in the `colors` array.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, orbit(x:y:period:), rotation)
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
        var firstText: String?
        var firstColor: Color?
        var textChange = false
        var colorChange = false
        for event in assessmentInfo.events {
            if case .placeAt(let graphic, _) = event {
                let phrase = graphic.text
                if firstText == nil {
                    firstText = phrase
                } else if graphic.text != firstText {
                    //Passed this flag
                    textChange = true
                }
                let textColor = graphic.textColor
                if firstColor == nil {
                    firstColor = textColor
                    
                } else if graphic.textColor != firstColor {
                    colorChange = true
                }
            }
        }
        if textChange && colorChange {
            return true
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
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")
//#-end-hidden-code
//#-editable-code
let name = "/*#-localizable-zone(ch2page08astring1)*/blue moon/*#-end-localizable-zone*/"
let things = ["/*#-localizable-zone(ch2page08astring2)*/green star/*#-end-localizable-zone*/", "/*#-localizable-zone(ch2page08astring3)*/black hole/*#-end-localizable-zone*/", "/*#-localizable-zone(ch2page08astring4)*/red giant/*#-end-localizable-zone*/", "/*#-localizable-zone(ch2page08astring5)*/white dwarf/*#-end-localizable-zone*/"]
let colors = [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
//#-end-editable-code
func addText(touch: Touch) {
    if touch.previousPlaceDistance < /*#-editable-code*/80/*#-end-editable-code*/ { return }
    //#-editable-code
//#-localizable-zone(ch2page08ak1)
    // Get index to a random item in things.
//#-end-localizable-zone
    let index = randomInt(from: 0, to: things.count - 1)
//#-localizable-zone(ch2page08ak2)
    // ✏️ Create graphic with a string from the things array at index.
//#-end-localizable-zone
    let graphic = Graphic(text: name)
//#-localizable-zone(ch2page08ak3)
    // ✏️ Change the font name and size.
//#-end-localizable-zone
    graphic.fontName = .avenirNext
    graphic.fontSize = 25
//#-localizable-zone(ch2page08ak4)
    // ✏️ Set to color from the colors array at index.
//#-end-localizable-zone
    graphic.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    //#-end-editable-code
    scene.place(graphic, at: touch.position)
}
//#-hidden-code
let textTool = Tool(name: NSLocalizedString("Text", comment: "The name of the text tool"), emojiIcon: "✍🏽")
textTool.onTouchMoved = addText
scene.tools.append(textTool)

playgroundEpilogue()

//#-end-hidden-code
