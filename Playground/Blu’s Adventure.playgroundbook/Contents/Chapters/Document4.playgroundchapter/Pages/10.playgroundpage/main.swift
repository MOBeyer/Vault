//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Create a tool to play an instrument when you touch a graphic.
 
 Use your coding skills to compose and play intergalactic music using instruments such as the guitar (electric and bass), piano, and—Blu’s favorite—the cosmic drums.
 
 To play an instrument, you call `playInstrument(_:note:volume:)`, choosing your instrument and a note to play.
 
 * callout(Example):
    `playInstrument(.piano, note: 12, volume: 50)`
 
 Each instrument has 16 notes, so the `note` parameter is an `Int` from 0 to 15. As with `playSound(_:volume:)`, the `volume` parameter is optional.
 
 Write code to make each type of fruit graphic play a different note when you touch it.
 
 1. In `musicalGraphic(graphic:)`, add an `if` statement for 🍐, 🍊, and 🍋, playing a different instrument and a note of your choice for each type of fruit.
 2. Run the code, then use the **Fruit** tool to add some fruit. Select the **Music** tool, then touch the fruit to make sure you hear a different note for each type.
 3. **Challenge**: Try setting the note for each to a random `Int` from 0 to 15.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, true, false, &&, ||, %, "", !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, alpha, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, moveAndZap(to:), moveAndRemove(to:duration:), playSound(_:), playSound(_:volume:), playInstrument(_:note:), playInstrument(_:note:volume:), text, electricGuitar, bassGuitar, cosmicDrums, piano, bark, bluDance, bluLookAround, bluHeadScratch, bluOops, data, electricity, hat, knock, phone, pop, snare, tennis, tick, walrus, warp, rotation)
//#-code-completion(identifier, hide, PageAssessment, playgroundPrologue(), playgroundEpilogue(), Touch, Color, Scene, _ImageLiteralType)
//#-code-completion(description, show, "[Int]")

import UIKit
import PlaygroundSupport
import CoreGraphics

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {
    
    var instrumentsPlayed = Set<Instrument.Kind>()
    
    // Custom per-page evaluation to determine pass/fail assessment.
    // Return `true` to mark the page as successful.
    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        if assessmentInfo.context != .tool { return nil }
        
        for event in assessmentInfo.events {
            if case .playInstrument(let instrument, _, _) = event {
                instrumentsPlayed.insert(instrument)
            }
        }
        
        if instrumentsPlayed.count > 2 {
            return true
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
//#-editable-code
let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

//#-localizable-zone(ch4page10k1)
// Event handler for Music tool.
//#-end-localizable-zone
func musicalGraphic(graphic: Graphic) {
    
//#-localizable-zone(ch4page10k2)
    // Play a note for Blu.
//#-end-localizable-zone
    if graphic == blu {
        playInstrument(.cosmicDrums, note: 12, volume: 50)
    }
    
//#-localizable-zone(ch4page10k3)
    // ✏️ Play a note on a different instrument for each type of fruit.
//#-end-localizable-zone
    if graphic.text == "🍐" {
        
    }
}

//#-localizable-zone(ch4page10k4)
// Event handler for Fruit tool.
//#-end-localizable-zone
func addFruit(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let fruit = "🍐🍊🍋".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphic.scale = 2.0
}

//#-localizable-zone(ch4page10k5)
// Create and add Fruit tool.
//#-end-localizable-zone
let fruitTool = Tool(name: "/*#-localizable-zone(ch4page10fruitTool)*/Fruit/*#-end-localizable-zone*/", emojiIcon: "🍊")
fruitTool.onTouchMoved = addFruit(touch:)
scene.tools.append(fruitTool)

//#-localizable-zone(ch4page10k6)
// Create and add Music tool.
//#-end-localizable-zone
let musicTool = Tool(name: "/*#-localizable-zone(ch4page10musicTool)*/Music/*#-end-localizable-zone*/", emojiIcon: "🎼")
musicTool.onGraphicTouched = musicalGraphic(graphic:)
scene.tools.append(musicTool)
//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
