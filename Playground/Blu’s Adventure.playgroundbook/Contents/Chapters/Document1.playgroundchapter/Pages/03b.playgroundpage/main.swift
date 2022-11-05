//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Experiment:** Decorate the cosmic bus.
 
 To help make your text graphics stand out, you can give them a cool text style (or [font](glossary://font)) and color. This is the art of [typography](glossary://typography).

 Read the code below. What do you think it does? Run it and see if you’re right.
 
 A graphic has several properties that you can use to set its text style:
 
 - **fontName:** A font from the `FontName` [enumeration](glossary://enumeration); for example, `georgia` or `markerfelt`.
 - **fontSize:** The size of the text; for example, 18.
 - **textColor:** The color of the text.
 
 Try decorating the cosmic bus by placing text graphics over it in as many different styles as you like. String constants `quote1` to `quote8` will help you get started.
 
 1. Experiment with different fonts, sizes, and text colors.
 2. Edit the quotes, or make up your own.
 3. Try using the `rotation` property of `Graphic`.
 
 When you’re finished decorating the bus, move on to the [**next page**](@next).
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
        return true
    }
}



public func playgroundPrologue() {
    registerEvaluator(PageAssessment(), style: .discrete)
    scene.useOverlay(overlay: .cosmicBus)
}


public func playgroundEpilogue() {
    performAssessment()
    scene.includeSystemTools = false
    scene.shouldHideTools = true
}

public typealias _ImageLiteralType = Image


playgroundPrologue()

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
//#-end-hidden-code
//#-editable-code
let quote1 = "if coder { code() }"
let quote2 = "Relativity Rules"
let quote3 = "Me? Sarcastic? Never."
let quote4 = "/* No Comment */"
let quote5 = "✸ Quasars Quake ✸"
let quote6 = "Bits unite. Bytes rule!"
let quote7 = "Cosmic Bus: Light years ahead!"
let quote8 = "• Code = Poetry •"

let graphic1 = Graphic(text: quote2)
graphic1.fontName = .chalkduster
graphic1.fontSize = 60
graphic1.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
graphic1.rotation = 10
scene.place(graphic1, at: Point(x: -150, y: 50))

//#-localizable-zone(ch1page03bk1)
// ✏️ Put more quotes on the bus.
//#-end-localizable-zone
let graphic2 = Graphic(text: quote5)

//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
