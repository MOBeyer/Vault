//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Customize your own soundboard.
 
Musicians often create customized instruments to help them make music. The soundboard here lets you do a similar thing—you can create and play your very own instrument using code.
 
 You use the instrument tools to add instrument graphics to the scene. When you select the **Play** tool and touch an instrument graphic, a note plays. Its pitch (high or low) depends on how far it is from the center of the scene. Using the **Move** tool, you can move graphics around until they play exactly the note you want.
 
 The **➕** and **➖** tools allow you to set the volume of an instrument graphic. Select either of these tools, and when you touch a graphic, its `alpha` and `scale` values change. Big and bright is loud; small and faded is quiet.
 
 Play with the soundboard and read the code carefully until you understand how it all works. Then try changing the tools or adding your own tools. (For ideas, press **Hint**.)
 
 When you’re finished making music, move on to the [**next page**](@next).
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
//#-editable-code
let theOrigin = Point(x: 0, y: 0)

//#-localizable-zone(ch4page11k1)
// Set volume of a graphic from 0.0 (silent) to 1.0 (full).
//#-end-localizable-zone
func setVolume(graphic: Graphic, volume: Number) {
    graphic.alpha = volume
    graphic.scale = volume * 3.0
}

//#-localizable-zone(ch4page11k2)
// Add instrument graphic to the scene.
//#-end-localizable-zone
func addInstrument(emoji: String, touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let graphic = Graphic(text: emoji)
    scene.place(graphic, at: touch.position)
//#-localizable-zone(ch4page11k3)
    // Set volume to 80%
//#-end-localizable-zone
    setVolume(graphic: graphic, volume: 0.8)
}

//#-localizable-zone(ch4page11k4)
// Event handler for Piano tool.
//#-end-localizable-zone
func addPiano(touch: Touch) {
    addInstrument(emoji: "🎹", touch: touch)
}

//#-localizable-zone(ch4page11k5)
// Event handler for Guitar tool.
//#-end-localizable-zone
func addGuitar(touch: Touch) {
    addInstrument(emoji: "🎸", touch: touch)
}

//#-localizable-zone(ch4page11k6)
// Event handler for Cosmic Drums tool.
//#-end-localizable-zone
func addCosmicDrums(touch: Touch) {
    addInstrument(emoji: "🔮", touch: touch)
}

//#-localizable-zone(ch4page11k7)
// Number of notes.
//#-end-localizable-zone
let noteSteps = 16

//#-localizable-zone(ch4page11k8)
// Event handler for Play tool.
//#-end-localizable-zone
func playInstrument(graphic: Graphic) {
    
//#-localizable-zone(ch4page11k9)
    // Distance from center 0.0 - 1.0.
//#-end-localizable-zone
    let distance = graphic.distance(from: theOrigin) / 707.0
    
//#-localizable-zone(ch4page11k10)
    // Translate distance into closest note Int value.
//#-end-localizable-zone
    let note = (1.0 - distance) * noteSteps
    
//#-localizable-zone(ch4page11k11)
    // Translate alpha into volume value.
//#-end-localizable-zone
    let volume = graphic.alpha * 100.0
    
//#-localizable-zone(ch4page11k12)
    // Play note with instrument.
//#-end-localizable-zone
    if graphic.text == "🎹" {
        playInstrument(.piano, note: note, volume: volume)
    }
    
    if graphic.text == "🎸" {
        playInstrument(.electricGuitar, note: note, volume: volume)
    }
    
    if graphic.text == "🔮" {
        playInstrument(.cosmicDrums, note: note, volume: volume)
    }
}

//#-localizable-zone(ch4page11k13)
// Event handler for volume +.
//#-end-localizable-zone
func volumeUp(graphic: Graphic) {
    var volume = graphic.alpha + 0.2
    if volume > 1.0 {
        volume = 1.0
    }
    setVolume(graphic: graphic, volume: volume)
}

//#-localizable-zone(ch4page11k14)
// Event handler for volume -.
//#-end-localizable-zone
func volumeDown(graphic: Graphic) {
    var volume = graphic.alpha - 0.2
    if volume < 0.4 {
        volume = 0.4
    }
    setVolume(graphic: graphic, volume: volume)
}

//#-localizable-zone(ch4page11k15)
// Create instrument tools.
//#-end-localizable-zone
let pianoTool = Tool(name: "/*#-localizable-zone(ch4page11pianoTool)*/Piano/*#-end-localizable-zone*/", emojiIcon: "🎹")
pianoTool.onTouchMoved = addPiano(touch:)
let guitarTool = Tool(name: "/*#-localizable-zone(ch4page11guitarTool)*/Guitar/*#-end-localizable-zone*/", emojiIcon: "🎸")
guitarTool.onTouchMoved = addGuitar(touch:)
let cosmicDrumsTool = Tool(name: "/*#-localizable-zone(ch4page11cosmicTool)*/Cosmic/*#-end-localizable-zone*/", emojiIcon: "🔮")
cosmicDrumsTool.onTouchMoved = addCosmicDrums(touch:)

//#-localizable-zone(ch4page11k16)
// Add instrument tools.
//#-end-localizable-zone
scene.tools.append(pianoTool)
scene.tools.append(guitarTool)
scene.tools.append(cosmicDrumsTool)

//#-localizable-zone(ch4page11k17)
// Create and add Play tool.
//#-end-localizable-zone
let playTool = Tool(name: "/*#-localizable-zone(ch4page11playTool)*/Play/*#-end-localizable-zone*/", emojiIcon: "👇")
playTool.onGraphicTouched = playInstrument(graphic:)
scene.tools.append(playTool)

//#-localizable-zone(ch4page11k18)
// Create and add Volume tools.
//#-end-localizable-zone
let volumeUpTool = Tool(name: "➕", emojiIcon: "")
volumeUpTool.onGraphicTouched = volumeUp(graphic:)
scene.tools.append(volumeUpTool)
let volumeDownTool = Tool(name: "➖", emojiIcon: "")
volumeDownTool.onGraphicTouched = volumeDown(graphic:)
scene.tools.append(volumeDownTool)

//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
