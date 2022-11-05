//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Turn Blu’s universe into a musical instrument.
 
 First run the code, then touch and drag around the scene like a DJ would. Can you guess how the code works?
 
 `playInstrument(touch:)` is the “touch moved” event handler for the **Play** tool. Each time you move your touch by more than `minimumDistance`, a note is played.
 
 In the x direction, the location you touch determines which note is played, similar to a virtual keyboard. In the y direction, the higher you move your touch, the louder the notes are played.
 
 For visual effect, each time a note is played, a graphic is placed on the scene at the touch position. The `scale` value of the graphic is set based on the volume, and the graphic is coded to fade away after a few seconds.
 
 Have fun playing with and customizing the instrument! Here are some ideas:
 
 * Instead of the snowflake ❄️, try a different emoji. Or pick an emoji from an array of emoji characters, depending on which note is being played.
 
 * Experiment with the graphic’s `scale` value, and `fadeOut(after:)` time.
 
 * Use a different instrument for each quadrant of the scene.
 
 When you’re finished making music, move on to the [**next page**](@next).
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, alpha, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, moveAndZap(to:), moveAndRemove(to:duration:), playSound(_:), playSound(_:volume:), playInstrument(_:note:), playInstrument(_:note:volume:), text, electricGuitar, bassGuitar, cosmicDrums, piano, bark, bluDance, bluLookAround, bluHeadScratch, bluOops, data, electricity, hat, knock, phone, pop, snare, tennis, tick, walrus, warp, rotation)
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

//#-end-hidden-code
//#-editable-code
scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
let theOrigin = Point(x: 0, y: 0)

//#-localizable-zone(ch5page01k1)
// Position of the last placed note.
//#-end-localizable-zone
var lastNotePosition = theOrigin
//#-localizable-zone(ch5page01k2)
// Number of available notes.
//#-end-localizable-zone
let numberOfNotes = 16
//#-localizable-zone(ch5page01k3)
// Maximum volume.
//#-end-localizable-zone
let maxVolume = 100
//#-localizable-zone(ch5page01k4)
// Minimum distance between notes.
//#-end-localizable-zone
let minimumDistance = 100

//#-localizable-zone(ch5page01k5)
// Event handler for the Piano tool.
//#-end-localizable-zone
func playInstrument(touch: Touch) {
    
//#-localizable-zone(ch5page01k6)
    // Space out the graphics.
//#-end-localizable-zone
    if touch.numberOfObjectsPlaced > 0 {
        let distanceFromLastNote = touch.position.distance(from: lastNotePosition)
        if distanceFromLastNote < minimumDistance { return }
    }
//#-localizable-zone(ch5page01k7)
    // Save the last position.
//#-end-localizable-zone
    lastNotePosition = touch.position
    
//#-localizable-zone(ch5page01k8)
    // Converts the x and y touch positions to be from 0 to 1.
//#-end-localizable-zone
    let normalizedXPosition = (touch.position.x + 500) / 1000
    let normalizedYPosition = (touch.position.y + 500) / 1000
    
//#-localizable-zone(ch5page01k9)
    // The note depends on the x position.
//#-end-localizable-zone
    let note = normalizedXPosition * (numberOfNotes - 1)
//#-localizable-zone(ch5page01k10)
    // The volume depends on the y position.
//#-end-localizable-zone
    let volume = normalizedYPosition * maxVolume
    
//#-localizable-zone(ch5page01k11)
    // Play the note.
//#-end-localizable-zone
    playInstrument(.piano, note: note, volume: volume)
    
//#-localizable-zone(ch5page01k12)
    // Place a graphic for the note.
//#-end-localizable-zone
    let graphic = Graphic(text: "❄️")
    scene.place(graphic, at: touch.position)
//#-localizable-zone(ch5page01k13)
    // The scale depends on the volume.
//#-end-localizable-zone
    graphic.scale = volume / 10
//#-localizable-zone(ch5page01k14)
    // Fade the graphic away after a short time.
//#-end-localizable-zone
    graphic.fadeOut(after: 1.5)
}

//#-localizable-zone(ch5page01k15)
// Create and add the Play tool.
//#-end-localizable-zone
let playTool = Tool(name: "/*#-localizable-zone(ch5page01playTool)*/Play/*#-end-localizable-zone*/", emojiIcon: "🎹")
playTool.onTouchMoved = playInstrument(touch:)
scene.tools.append(playTool)

//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
