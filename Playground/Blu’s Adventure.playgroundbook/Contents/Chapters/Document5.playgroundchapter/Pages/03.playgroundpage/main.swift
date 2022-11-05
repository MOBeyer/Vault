//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Build your own digital lock!
 
 
 The only way your friends can get to your top-secret photo is by touching the emoji keys *in the right order*. If they get it wrong, everything is destroyed! 💥
 
 When you press **Lock**, the `lock()` function is called. This function scatters the emoji keys around the scene and sets `matchIndex` to `0`.
 
 When you touch a key, the `touchedKey(graphic:)` event handler is called. If `graphic` matches the key at `matchIndex`, `matchIndex` is [incremented](glossary://increment). When the last required key is touched, the event handler calls `unlockSecret()`.
 
 * callout(Check if unlocked):
 `if keys[matchIndex] == keys.last {`\
 `   unlockSecret()`\
 `}`
 
 **Experiment:**
 
 * Change `hiddenImage` to a photo of your own.
 * Try different sets of emoji for the keys.
 * Use your own background image.
 * Make the sequence more difficult; for example, you have to touch the first key once, the second twice, and so on.
 * Clutter the scene with other emoji that do nothing when you touch them.
 * Instead of displaying an image in `unlockSecret()`, reveal or speak a secret message.
 
 When you’re done, move on to the [**next page**](@next).
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, alpha, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeIn(after:), fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, moveAndZap(to:), moveAndRemove(to:duration:), playSound(_:), playSound(_:volume:), playInstrument(_:note:), playInstrument(_:note:volume:), text, electricGuitar, bassGuitar, cosmicDrums, piano, bark, bluDance, bluLookAround, bluHeadScratch, bluOops, data, electricity, hat, knock, phone, pop, snare, tennis, tick, walrus, warp, rotation)
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
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheGreenFrontier@2x.png")
//#-localizable-zone(ch5page03k1)
// Emoji to be touched in the correct order.
//#-end-localizable-zone
let emoji = "🥝🍭🍋🍔🍿"
//#-localizable-zone(ch5page03k2)
// Image to be unlocked: Choose your own.
//#-end-localizable-zone
let hiddenImage = #imageLiteral(resourceName: "CosmicBus.png")

//#-localizable-zone(ch5page03k3)
// Array of characters in emoji.
//#-end-localizable-zone
let keys = emoji.componentsByCharacter()
//#-localizable-zone(ch5page03k4)
// Index to next key to match.
//#-end-localizable-zone
var matchIndex = 0

//#-localizable-zone(ch5page03k5)
// Set up final positions for the keys.
//#-end-localizable-zone
var finalPositions: [Point] = []
var finalPosition = Point(x: -400, y: 400)
for key in keys {
    finalPosition.x += 125
    finalPositions.append(finalPosition)
}

//#-localizable-zone(ch5page03k6)
// Prompt to begin.
//#-end-localizable-zone
let prompt = Graphic(text: "/*#-localizable-zone(ch5page03prompt)*/Press '🔒 Lock' to begin./*#-end-localizable-zone*/")
prompt.fontName = .avenirNext
prompt.fontSize = 50
prompt.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
scene.place(prompt, at: Point(x: 0, y: 0))

//#-localizable-zone(ch5page03k7)
// This function is called when you press the Lock button.
//#-end-localizable-zone
func lock() {
    scene.clear()
//#-localizable-zone(ch5page03k8)
    // Reset to point to the first key.
//#-end-localizable-zone
    matchIndex = 0
//#-localizable-zone(ch5page03k9)
    // Add keys in random positions.
//#-end-localizable-zone
    var position = Point(x: 999, y: 999)
    for key in keys {
        let graphic = Graphic(text: key)
        graphic.scale = 2.0
        graphic.rotation = randomDouble(from: -360, to: 360)
//#-localizable-zone(ch5page03k10)
        // Get a new random position distant from the other keys.
//#-end-localizable-zone
        var distanceFromNearest = 0.0
        let minimumDistance = 150
//#-localizable-zone(ch5page03k11)
        // Keep getting a new position until it’s at least minimumDistance from any other graphic.
//#-end-localizable-zone
        while distanceFromNearest < minimumDistance {
            position.x = randomDouble(from: -450, to: 450)
            position.y = randomDouble(from: -450, to: 350)
            distanceFromNearest = 999
//#-localizable-zone(ch5page03k12)
            // Get the distance from the nearest graphic.
//#-end-localizable-zone
            for graphic in scene.graphics {
                let distance = position.distance(from: graphic.position)
                if distance < distanceFromNearest {
                    distanceFromNearest = distance
                }
            }
        }
//#-localizable-zone(ch5page03k13)
        // Place the key at the new random position.
//#-end-localizable-zone
        scene.place(graphic, at: position)
    }
}

//#-localizable-zone(ch5page03k14)
// This function is called each time you touch a key (graphic).
//#-end-localizable-zone
func touchedKey(graphic: Graphic) {
    if graphic.text == keys[matchIndex] {
//#-localizable-zone(ch5page03k15)
        // Match: Move the key to its final position.
//#-end-localizable-zone
        graphic.scale = 2.5
        graphic.rotation = 0
        graphic.move(to: finalPositions[matchIndex], duration: 0.25)
        playSound(.pop)
//#-localizable-zone(ch5page03k16)
        // Is this the last match?
//#-end-localizable-zone
        if keys[matchIndex] == keys.last {
//#-localizable-zone(ch5page03k17)
            // The last key matched, so unlock the secret.
//#-end-localizable-zone
            unlockSecret()
        } else {
//#-localizable-zone(ch5page03k18)
            // Point to the next key.
//#-end-localizable-zone
            matchIndex += 1
        }
    } else {
//#-localizable-zone(ch5page03k19)
        // No match: Fade all the keys.
//#-end-localizable-zone
        playSound(.wap)
        for graphic in scene.graphics {
            graphic.fadeOut(after: 0.25)
        }
    }
}

//#-localizable-zone(ch5page03k20)
// This function is called when all the keys are touched in the right order.
//#-end-localizable-zone
func unlockSecret() {
//#-localizable-zone(ch5page03k21)
    // Fade out the keys.
//#-end-localizable-zone
    for graphic in scene.graphics {
        graphic.fadeOut(after: 0.25)
    }
    
//#-localizable-zone(ch5page03k22)
    // Play a sound effect.
//#-end-localizable-zone
    playSound(.electricity)
    
//#-localizable-zone(ch5page03k23)
    // Show the hidden image.
//#-end-localizable-zone
    let graphic = Graphic(image: hiddenImage)
    scene.place(graphic, at: Point(x: 0, y: 0))
    graphic.alpha = 0.0
    graphic.scale = 2.0
    graphic.fadeIn(after: 1.0)
}

//#-localizable-zone(ch5page03k24)
// Create and add the Unlock tool.
//#-end-localizable-zone
let unlockTool = Tool(name: "/*#-localizable-zone(ch5page03drawTool)*/Unlock/*#-end-localizable-zone*/", emojiIcon: "🔑")
unlockTool.onGraphicTouched = touchedKey(graphic:)
scene.tools.append(unlockTool)

//#-localizable-zone(ch5page03k25)
// Create and add the Lock button.
//#-end-localizable-zone
let shuffleButton = Button(name: "/*#-localizable-zone(ch5page03lockTool)*/🔒 Lock/*#-end-localizable-zone*/")
shuffleButton.onPress = lock
scene.button = shuffleButton
//#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
