//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Use the **Text** tool to scatter emoji.
 
 Put together the Japanese words for picture (絵) and character (文字), and you get emoji (絵文字). And that’s exactly what an emoji is: a picture character 🌠.
 
 Like with all characters, you can include emoji in text strings and mix them with other characters.
 
 * callout(Including emoji in a string):
    `let cheer = "What a goal!! ⚽️ 🙌"`
 
 You can also split any string into an array of single-character strings:
 
 * callout(Splitting a string into its characters):
    `let flora = "🌺🌻🌹🌷"`\
    `let flowers = flora.componentsByCharacter()`
 
 This is useful to know if you want to place each character on the scene individually.
 
 1. Split `emoji` into an array of single-character strings, and call the array `characters`.
 
 2. In the `addText` function, add code to set `chosenEmoji` equal to item `index` of the `characters` array (`characters[index]`).
 
 3. Add code to [increment](glossary://increment) `index` so that it points to the next item.
 
 4. Add code to set `index` back to zero if it reaches the end of the array (`characters.count`).
*/
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, color, array, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), orbit(x:y:period:), rotation)
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
        
        for event in assessmentInfo.events {
            if case .placeAt(let graphic, _) = event {
                let phrase = graphic.text
                if firstText == nil {
                    firstText = phrase
                } else if graphic.text != firstText {
                    //Passed this flag
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
    scene.shouldHideTools = false
}

public typealias _ImageLiteralType = Image

playgroundPrologue()

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")
//#-end-hidden-code
//#-editable-code
let emoji = "✨🌝🔦💫👀☄️🌎"
//#-localizable-zone(ch2page08bk1)
// ✏️ Split emoji into an array of single-character strings.
//#-end-localizable-zone

//#-localizable-zone(ch2page08bk2)
// Index to next item in characters array.
//#-end-localizable-zone
var index = 0
//#-end-editable-code

func addText(touch: Touch) {
    if touch.previousPlaceDistance < /*#-editable-code*/80/*#-end-editable-code*/ { return }
    //#-editable-code
    var chosenEmoji = "🐠"
//#-localizable-zone(ch2page08bk3)
    // ✏️ Set chosenEmoji to item index of characters array.
//#-end-localizable-zone
    
//#-localizable-zone(ch2page08bk4)
    // Create graphic from the chosen emoji.
//#-end-localizable-zone
    let graphic = Graphic(text: chosenEmoji)
//#-localizable-zone(ch2page08bk5)
    // ✏️ Increment index to point to next item.
//#-end-localizable-zone
    
//#-localizable-zone(ch2page08bk6)
    // ✏️ Reset index if it’s reached the end of the array.
//#-end-localizable-zone
    
//#-localizable-zone(ch2page08bk7)
    // Set `scale` and `rotation`.
//#-end-localizable-zone
    graphic.scale = 1.5
    graphic.rotation = randomDouble(from: 0.0, to: 180)
    //#-end-editable-code
    scene.place(graphic, at: touch.position)
}
//#-hidden-code
let textTool = Tool(name: NSLocalizedString("Text", comment: "The name of the text tool"), emojiIcon: "👀")
textTool.onTouchMoved = addText
scene.tools.append(textTool)

playgroundEpilogue()

//#-end-hidden-code




