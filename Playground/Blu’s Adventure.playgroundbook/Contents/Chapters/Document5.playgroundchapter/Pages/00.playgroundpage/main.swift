//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Show off your artistic—and coding—skills!
 
 Run the code, and then press the **Draw** button to reveal a bunch of tools. The top four are for drawing as you touch and drag around the scene. You can use the rest to change what you’ve already drawn. Try them out!
 
 When you press **Fill**, the entire scene is filled with emoji. Can you spot the odd one out?!
 
 Not only can you draw with these tools, but you can also change the way they work by editing the code. You’ll find a function for each tool in the code. Here are some ideas:
 
 * Experiment with different sets of emoji in the drawing and fill tools.
 
 * In `driftDraw(touch:)`, try changing `maxScale`.
 
 * In `swirlDraw(touch:)`, try changing `radius`.
 
 * In `fill()`, try using square emoji 🌃 and a `scale` of `2.0` so the emoji completely cover the scene. Add code before you call `fillScene()` to place a graphic in a random position. Then use the **Erase** tool to see how many touches it takes you to find it!
 
 * Invent your own tools. 🛠
 
 * Share your creation with your friends.
 
 When you’re finished, move on to the [**next page**](@next).
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, alpha, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, moveAndZap(to:), moveAndRemove(to:duration:), playSound(_:), playSound(_:volume:), playInstrument(_:note:), playInstrument(_:note:volume:), text, electricGuitar, bassGuitar, cosmicDrums, piano, bark, bluDance, bluLookAround, bluHeadScratch, bluOops, data, electricity, hat, knock, phone, pop, snare, tennis, tick, walrus, warp, rotation)
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

// Returns a value that cycles between 0.0 and 1.0 as n increases.
func cycleValue(n: Int) -> Double {
    let thetaDegrees = 5.0
    let theta = thetaDegrees * Double.pi / 180.0
    let angle = n * theta
    return sin(angle).double
}

// Returns an (x, y) offset that cycles between 0.0 and 1.0 as n increases.
func cycleOffset(n: Int) -> Point {
    let thetaDegrees = 30.0
    let theta = thetaDegrees * Double.pi / 180.0
    let angle = n * theta
    var offset = Point(x: 0, y: 0)
    offset.x = cos(angle).double
    offset.y = sin(angle).double
    return offset
}
//#-end-hidden-code
//#-editable-code
scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")
//#-localizable-zone(ch5page00k1)
// The last position you touched.
//#-end-localizable-zone
var lastTouchPosition = Point(x: 0, y: 0)

//#-localizable-zone(ch5page00k2)
// Draws emoji as you touch and drag.
//#-end-localizable-zone
var drawIndex = 0
func draw(touch: Touch) {
//#-localizable-zone(ch5page00k3)
    // Emoji to draw with.
//#-end-localizable-zone
    let emoji = "🌏🌕🎾"
//#-localizable-zone(ch5page00k4)
    // Space out the graphics.
//#-end-localizable-zone
    let distance = touch.position.distance(from: lastTouchPosition)
    if distance < 20 { return }
    lastTouchPosition = touch.position
//#-localizable-zone(ch5page00k5)
    // Use the next emoji to place a graphic at the touch position.
//#-end-localizable-zone
    let emojiCharacters = emoji.componentsByCharacter()
    let graphic = Graphic(text: emojiCharacters[drawIndex])
    scene.place(graphic, at: touch.position)
//#-localizable-zone(ch5page00k6)
    // Scale the graphic.
//#-end-localizable-zone
    graphic.scale = 1.5
//#-localizable-zone(ch5page00k7)
    // Point drawIndex to the next emoji character.
//#-end-localizable-zone
    drawIndex += 1
//#-localizable-zone(ch5page00k8)
    // Reset drawIndex if it’s reached the end of the array.
//#-end-localizable-zone
    if drawIndex >= emojiCharacters.count {
        drawIndex = 0
    }
}

//#-localizable-zone(ch5page00k9)
// Draws drifts of emoji as you touch and drag.
//#-end-localizable-zone
var driftIndex = 0
var driftCount = 0
func driftDraw(touch: Touch) {
//#-localizable-zone(ch5page00k10)
    // Emoji to draw with.
//#-end-localizable-zone
    let emoji = "☣️㊙️"
//#-localizable-zone(ch5page00k11)
    // Space out the graphics.
//#-end-localizable-zone
    let distance = touch.position.distance(from: lastTouchPosition)
    if distance < 20 { return }
    lastTouchPosition = touch.position
//#-localizable-zone(ch5page00k12)
    // Use the next emoji to place a graphic at the touch position.
//#-end-localizable-zone
    let emojiCharacters = emoji.componentsByCharacter()
    let graphic = Graphic(text: emojiCharacters[driftIndex])
    scene.place(graphic, at: touch.position)
//#-localizable-zone(ch5page00k13)
    // Scale cycles between 0.0 and maxScale, depending on the number of graphics placed.
//#-end-localizable-zone
    let maxScale = 2.5
    graphic.scale = maxScale * cycleValue(n: driftCount)
    driftCount += 1
//#-localizable-zone(ch5page00k14)
    // Point driftIndex to the next emoji character.
//#-end-localizable-zone
    driftIndex += 1
//#-localizable-zone(ch5page00k15)
    // Reset driftIndex if it’s reached the end of the array.
//#-end-localizable-zone
    if driftIndex >= emojiCharacters.count {
        driftIndex = 0
    }
}

//#-localizable-zone(ch5page00k16)
// Draws swirling emoji as you touch and drag.
//#-end-localizable-zone
var swirlIndex = 0
var swirlCount = 0
func swirlDraw(touch: Touch) {
//#-localizable-zone(ch5page00k17)
    // Emoji to draw with.
//#-end-localizable-zone
    let emoji = "🌼🌸🌺"
//#-localizable-zone(ch5page00k18)
    // Space out the graphics.
//#-end-localizable-zone
    let distance = touch.position.distance(from: lastTouchPosition)
    if distance < 5 { return }
    lastTouchPosition = touch.position
//#-localizable-zone(ch5page00k19)
    // Use the next emoji to place a graphic.
//#-end-localizable-zone
    let emojiCharacters = emoji.componentsByCharacter()
    let graphic = Graphic(text: emojiCharacters[swirlIndex])
//#-localizable-zone(ch5page00k20)
    // Position cycles around the touch position, depending on the number of graphics placed.
//#-end-localizable-zone
    var position = touch.position
    let offset = cycleOffset(n: swirlCount)
    swirlCount += 1
    let radius = 60.0
    position.x += offset.x * radius
    position.y += offset.y * radius
//#-localizable-zone(ch5page00k21)
    // Place a graphic at the calculated position.
//#-end-localizable-zone
    scene.place(graphic, at: position)
//#-localizable-zone(ch5page00k22)
    // Scale the graphic.
//#-end-localizable-zone
    graphic.scale = 0.75
//#-localizable-zone(ch5page00k23)
    // Point swirlIndex to the next emoji character.
//#-end-localizable-zone
    swirlIndex += 1
//#-localizable-zone(ch5page00k24)
    // Reset swirlIndex if it’s reached the end of the array.
//#-end-localizable-zone
    if swirlIndex >= emojiCharacters.count {
        swirlIndex = 0
    }
}

//#-localizable-zone(ch5page00k25)
// Draws fried eggs as you touch and drag.
//#-end-localizable-zone
func friedEgg(touch: Touch) {
//#-localizable-zone(ch5page00k26)
    // Space out the eggs.
//#-end-localizable-zone
    let distance = touch.position.distance(from: lastTouchPosition)
    if distance < 40 { return }
    lastTouchPosition = touch.position
//#-localizable-zone(ch5page00k27)
    // Place the egg white.
//#-end-localizable-zone
    let white = Graphic(text: "⚪️")
    scene.place(white, at: touch.position)
//#-localizable-zone(ch5page00k28)
    // Scale the egg white.
//#-end-localizable-zone
    white.scale = 2.0
//#-localizable-zone(ch5page00k29)
    // Fade the egg white a little.
//#-end-localizable-zone
    white.alpha = 0.8
//#-localizable-zone(ch5page00k30)
    // Place the egg yolk.
//#-end-localizable-zone
    let yolk = Graphic(text: "😶")
    scene.place(yolk, at: touch.position)
//#-localizable-zone(ch5page00k31)
    // Rotate the egg yolk by a random angle.
//#-end-localizable-zone
    yolk.rotation = randomDouble(from: -180.0, to: 180.0)
//#-localizable-zone(ch5page00k32)
    // Scale the egg yolk.
//#-end-localizable-zone
    yolk.scale = 1.0
}

//#-localizable-zone(ch5page00k33)
// Fades a graphic when you touch it.
//#-end-localizable-zone
func fade(graphic: Graphic) {
    graphic.alpha -= 0.1
}

//#-localizable-zone(ch5page00k34)
// Rotates a graphic when you touch it.
//#-end-localizable-zone
func rotate(graphic: Graphic) {
    graphic.rotation += 45.0
}

//#-localizable-zone(ch5page00k35)
// Scales up a graphic when you touch it.
//#-end-localizable-zone
func scaleUp(graphic: Graphic) {
    graphic.scale *= 1.5
}

//#-localizable-zone(ch5page00k36)
// Scales down a graphic when you touch it.
//#-end-localizable-zone
func scaleDown(graphic: Graphic) {
    graphic.scale *= 1.0 / 1.5
}

//#-localizable-zone(ch5page00k37)
// Fills the entire scene with a grid of emoji.
//#-end-localizable-zone
func fillScene(emoji: String, scale: Double) {
    let emojiCharacters = emoji.componentsByCharacter()
    var index = 0
//#-localizable-zone(ch5page00k38)
    // Get count points in a grid of size * size.
//#-end-localizable-zone
    let points = scene.gridPoints(size: 925, count: 256)
//#-localizable-zone(ch5page00k39)
    // Create a graphic for each point and place it.
//#-end-localizable-zone
    for point in points {
        let graphic = Graphic(text: emojiCharacters[index])
        scene.place(graphic, at: point)
//#-localizable-zone(ch5page00k40)
        // Scale the graphic.
//#-end-localizable-zone
        graphic.scale = scale
//#-localizable-zone(ch5page00k41)
        // Point index to the next emoji character.
//#-end-localizable-zone
        index += 1
//#-localizable-zone(ch5page00k42)
        // Reset index if it’s reached the end of the array.
//#-end-localizable-zone
        if index == emojiCharacters.count {
            index = 0
        }
    }
}

//#-localizable-zone(ch5page00k43)
// This function is called when the Fill button is pressed.
//#-end-localizable-zone
func fill() {
    scene.clear()
//#-localizable-zone(ch5page00k44)
    // Fill the scene with emoji.
//#-end-localizable-zone
    fillScene(emoji: "🌲🌳🌴", scale: 1.0)
//#-localizable-zone(ch5page00k45)
    // Change one of the graphics to a different emoji.
//#-end-localizable-zone
    let n = randomInt(from: 0, to: scene.graphics.count - 1)
    scene.graphics[n].text = "🍏"
}

//#-localizable-zone(ch5page00k46)
// Create and add the Draw tool.
//#-end-localizable-zone
let drawTool = Tool(name: "/*#-localizable-zone(ch5page00drawTool)*/Draw/*#-end-localizable-zone*/", emojiIcon: "🌍")
drawTool.onTouchMoved = draw(touch:)
scene.tools.append(drawTool)

//#-localizable-zone(ch5page00k47)
// Create and add the Drift tool.
//#-end-localizable-zone
let driftTool = Tool(name: "/*#-localizable-zone(ch5page00driftTool)*/Drift/*#-end-localizable-zone*/", emojiIcon: "㊙️")
driftTool.onTouchMoved = driftDraw(touch:)
scene.tools.append(driftTool)

//#-localizable-zone(ch5page00k48)
// Create and add the Swirl tool.
//#-end-localizable-zone
let swirlTool = Tool(name: "/*#-localizable-zone(ch5page00swirlTool)*/Swirl/*#-end-localizable-zone*/", emojiIcon: "🌼")
swirlTool.onTouchMoved = swirlDraw(touch:)
scene.tools.append(swirlTool)

//#-localizable-zone(ch5page00k49)
// Create and add the Fried Egg tool.
//#-end-localizable-zone
let friedEggTool = Tool(name: "/*#-localizable-zone(ch5page00friedEggTool)*/Fried Egg/*#-end-localizable-zone*/", emojiIcon: "🍳")
friedEggTool.onTouchMoved = friedEgg(touch:)
scene.tools.append(friedEggTool)

//#-localizable-zone(ch5page00k50)
// Create and add the Fade tool.
//#-end-localizable-zone
let fadeDownTool = Tool(name: "/*#-localizable-zone(ch5page00fadeTool)*/Fade/*#-end-localizable-zone*/", emojiIcon: "⛅️")
fadeDownTool.onGraphicTouched = fade(graphic:)
scene.tools.append(fadeDownTool)

//#-localizable-zone(ch5page00k51)
// Create and add the Bigger tool.
//#-end-localizable-zone
let scaleUpTool = Tool(name: "/*#-localizable-zone(ch5page00scaleUpTool)*/Bigger/*#-end-localizable-zone*/", emojiIcon: "➕")
scaleUpTool.onGraphicTouched = scaleUp(graphic:)
scene.tools.append(scaleUpTool)

//#-localizable-zone(ch5page00k52)
// Create and add the Smaller tool.
//#-end-localizable-zone
let scaleDownTool = Tool(name: "/*#-localizable-zone(ch5page00scaleDownTool)*/Smaller/*#-end-localizable-zone*/", emojiIcon: "➖")
scaleDownTool.onGraphicTouched = scaleDown(graphic:)
scene.tools.append(scaleDownTool)

//#-localizable-zone(ch5page00k53)
// Create and add the Fill button.
//#-end-localizable-zone
let fillButton = Button(name: "/*#-localizable-zone(ch5page00fillButton)*/Fill/*#-end-localizable-zone*/")
fillButton.onPress = fill
scene.button = fillButton
//#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
