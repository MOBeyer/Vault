//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Have fun:** Discover some of the exciting things you’ll do with code in **Blu’s Adventure**!
 
 To get started, press **Run My Code**. Touch and drag around the universe—the box inside the dotted lines—and watch how emoji appear. Press **Clear** to start again.
 
 Now press **Draw** to get a list of buttons. You’ll soon be writing code to make these buttons do fun things, but for now, just try them out. Choose a button by pressing it:
 
 * 🖌 **Draw**: Place emoji on the universe as you touch and drag.
 
 * ❄️ **Kaleido**: Create patterns as you touch and drag.

 * 🎶 **Play**: Touch the emoji to turn the universe into a musical instrument.
 
 * 🗣 **Hello**: Get the emoji to make noises—or even talk back—when you touch them!
 
 * ⚡️ **Goodbye**: Tumble the emoji out of the universe by touching them.
 
 You can even just reach over and press the **Astrodance** button to get those emoji moving! 💃🏻🕺🏻
 
 Before you [move on](@next), try a tiny bit of coding. Choose different emoji, or a different number of dancers, by editing the code. After you make your changes, press **Run My Code**. Then press **Astrodance** to make your emoji dance again.
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

/// Speaks the given text.
///
/// - Parameter text: The text to be spoken.
///
/// - localizationKey: speak1(_:)
func speak(_ text: String) {
    
    stopSpeaking()
    
    var voice = SpeechVoice(accent: .british)
    voice.pitch = 40
    voice.speed = 20
    
    speak(text, voice: voice)
}

var dancers: [Graphic] = []

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")

var lastPlacePosition = Point(x: 0, y: 0)
let center = Point(x: 0, y: 0)
//#-end-hidden-code
//#-editable-code
//#-localizable-zone(ch0page00prose1k1)
// Try using different emoji—for example, colorful flags.
//#-end-localizable-zone
let emoji = "🌕🎾⚾️🌍⚽️"
//#-localizable-zone(ch0page00prose1k2)
// Try changing the number of dancers.
//#-end-localizable-zone
let numberOfDancers = 200
//#-end-editable-code
/*:#localized(key: "SecondProseBlock")
 Wondering what the code for this page is like? Go ahead and browse the code in the functions below, but *don’t worry if it looks a bit scary.* Before you know it, you’ll be writing code just like this!

 When you’re ready to get started, move on to the [**next page**](@next).
 */
//#-editable-code
//#-localizable-zone(ch0page00k1)
// Draw: As you touch and drag around, this function is called each time your touch moves, adding emoji to the scene.
//#-end-localizable-zone
func addEmoji(touch: Touch) {
    if touch.previousPlaceDistance < 100 { return }
    let characters = emoji.componentsByCharacter()
    let graphic = Graphic(text: characters.randomItem)
    scene.place(graphic, at: touch.position)
}

//#-localizable-zone(ch0page00k2)
// Kaleido: As you touch and drag around, this function is called each time your touch moves, adding emoji to the scene in symmetrical patterns.
//#-end-localizable-zone
func addKaleidoImage(touch: Touch) {
    let characters = emoji.componentsByCharacter()
//#-localizable-zone(ch0page00k3)
    // Space out graphics.
//#-end-localizable-zone
    let placeDistance = touch.position.distance(from: lastPlacePosition)
    if placeDistance < 80 { return }
    lastPlacePosition = touch.position
//#-localizable-zone(ch0page00k4)
    // Create graphics for each quadrant and add to an array.
//#-end-localizable-zone
    var graphics: [Graphic] = []
    for i in 0 ..< 4 {
        let graphic = Graphic(text: characters.randomItem)
        graphics.append(graphic)
    }
//#-localizable-zone(ch0page00k5)
    // Get absolute x, y values.
//#-end-localizable-zone
    let x = abs(touch.position.x)
    let y = abs(touch.position.y)
//#-localizable-zone(ch0page00k6)
    // Position a graphic in each quadrant.
//#-end-localizable-zone
    let position1 = Point(x: x, y: y)
    scene.place(graphics[0], at: position1)
    let position2 = Point(x: x, y: -y)
    scene.place(graphics[1], at: position2)
    let position3 = Point(x: -x, y: -y)
    scene.place(graphics[2], at: position3)
    let position4 = Point(x: -x, y: y)
    scene.place(graphics[3], at: position4)
}

//#-localizable-zone(ch0page00k7)
// Play: When you touch an emoji, this function is called to play a note on the cosmic drums.
//#-end-localizable-zone
func playNote(graphic: Graphic) {
//#-localizable-zone(ch0page00k8)
    // Number of notes.
//#-end-localizable-zone
    let noteSteps = 16
//#-localizable-zone(ch0page00k9)
    // Distance from the center 0.0 - 1.0.
//#-end-localizable-zone
    let center = Point(x: 0, y: 0)
    let distance = graphic.distance(from: center) / 707.0
//#-localizable-zone(ch0page00k10)
    // Translate distance into closest note Int value.
//#-end-localizable-zone
    let note = (1.0 - distance) * noteSteps
//#-localizable-zone(ch0page00k11)
    // Translate alpha into volume value.
//#-end-localizable-zone
    let volume = graphic.alpha * 100.0
//#-localizable-zone(ch0page00k12)
    // Play the note.
//#-end-localizable-zone
    playInstrument(.cosmicDrums, note: note, volume: volume)
}

//#-localizable-zone(ch0page00k13)
// Hello: When you touch an emoji, this function is called to speak or make a sound.
//#-end-localizable-zone
func sayHello(graphic: Graphic) {
//#-localizable-zone(ch0page00k14)
    // Choose what to do based on emoji.
//#-end-localizable-zone
    switch graphic.text {
    case "🌕":
        speak("/*#-localizable-zone(Ch0Page00k1)*/Planet smelly cheese./*#-end-localizable-zone*/")
    case "🎾":
        playSound(.tennis)
    case "⚾️":
        playSound(.wap)
    case "🌍":
        speak("/*#-localizable-zone(Ch0Page00k2)*/Blue marble./*#-end-localizable-zone*/")
    case "⚽️":
        speak("/*#-localizable-zone(Ch0Page00k3)*/Planet soccer ball./*#-end-localizable-zone*/")
    default:
        speak(graphic.text)
    }
}

//#-localizable-zone(ch0page00k15)
// Goodbye: When you touch an emoji, this function is called to make a graphic disappear.
//#-end-localizable-zone
func fadeAway(graphic: Graphic) {
    playSound(.tumble)
    let sinkHole = Point(x: graphic.position.x, y: -800)
    graphic.moveAndRemove(to: sinkHole, duration: 2.5)
    graphic.fadeOut(after: 2.0)
}

//#-localizable-zone(ch0page00k16)
// Astrodance: When you press the button, this function rearranges emoji into lovely patterns.
//#-end-localizable-zone
func dance() {
//#-localizable-zone(ch0page00k17)
    // Limit the number of dancers.
//#-end-localizable-zone
    let maximumNumberOfDancers = 500
    let actualNumberOfDancers = min(numberOfDancers, maximumNumberOfDancers)
//#-localizable-zone(ch0page00k18)
    // Place the dancers on the scene, if necessary.
//#-end-localizable-zone
    if scene.graphics.count != actualNumberOfDancers {
        scene.clear()
        dancers = []
        var index = 0
        let emojiCharacters = emoji.componentsByCharacter()
        for i in 0..<actualNumberOfDancers {
            let dancer = Graphic(text: emojiCharacters[index])
            scene.place(dancer, at: center)
            dancers.append(dancer)
            index += 1
            if index == emojiCharacters.count {
                index = 0
            }
        }
    }
//#-localizable-zone(ch0page00k19)
    // Get a new pattern.
//#-end-localizable-zone
    let pattern = randomInt(from: 1, to: 3)
//#-localizable-zone(ch0page00k20)
    // Rearrange the dancers.
//#-end-localizable-zone
    rearrange(dancers: dancers, pattern: pattern, instrument: .cosmicDrums)
}

//#-localizable-zone(ch0page00k21)
// Rearrange the dancers to a pattern accompanied by an instrument.
//#-end-localizable-zone
func rearrange(dancers: [Graphic], pattern: Int, instrument: Instrument.Kind) {
    
    var points = [Point]()
    var note = 5
    
//#-localizable-zone(ch0page00k22)
    // Start with all points in the center.
//#-end-localizable-zone
    for i in 0..<dancers.count {
        points.append(center)
    }
    
//#-localizable-zone(ch0page00k23)
    // Get a new set of points depending on the pattern:
    // Pattern 0: Points in the center.
    // Pattern 1: Points in a circle.
//#-end-localizable-zone
    if pattern == 1 {
        let radius = randomDouble(from: 100, to: 450)
        points = scene.circlePoints(radius: radius, count: dancers.count)
        note = 14
    }
//#-localizable-zone(ch0page00k24)
    // Pattern 3: Points in a spiral.
//#-end-localizable-zone
    if pattern == 2 {
        let spacing = randomDouble(from: 50, to: 200)
        points = scene.spiralPoints(spacing: spacing, count: dancers.count)
        note = 10
    }
//#-localizable-zone(ch0page00k25)
    // Pattern 4: Hypotrochoid.
//#-end-localizable-zone
    if pattern == 3 {
        let r1 = randomDouble(from: 200.0, to: 400.0)
        let r2 = randomDouble(from: 50.0, to: 100.0)
        let d = randomDouble(from: 0.5, to: 2.0)
        points = scene.hypotrochoidPoints(r1: r1, r2: r2, d: d, count: dancers.count)
        note = 12
    }

//#-localizable-zone(ch0page00k26)
    // Shift all points by a random x, y distance.
//#-end-localizable-zone
    let dx = randomDouble(from: -250, to: 250)
    let dy = randomDouble(from: -250, to: 250)
    
    for i in 0..<dancers.count {
        points[i].x += dx
        points[i].y += dy
    }

//#-localizable-zone(ch0page00k27)
    // Get random values.
//#-end-localizable-zone
    let duration = randomDouble(from: 0.25, to: 2.0)
    let rotation = randomDouble(from: -360, to: 360)
    
//#-localizable-zone(ch0page00k28)
    // Animate dancers to their new positions.
//#-end-localizable-zone
    for i in 0..<dancers.count {
        dancers[i].move(to: points[i], duration: duration)
//#-localizable-zone(ch0page00k29)
        // Scale based on the distance from the center.
//#-end-localizable-zone
        let distance = points[i].distance(from: center) / 707.0
        dancers[i].scale = 0.25 + (distance * 2.0)
        dancers[i].rotation = rotation
    }
    
//#-localizable-zone(ch0page00k30)
    // Play a note on the instrument.
//#-end-localizable-zone
    playInstrument(instrument, note: note, volume: 50)
}

//#-localizable-zone(ch0page00k31)
// Create and add the Draw button.
//#-end-localizable-zone
let emojiTool = Tool(name: "/*#-localizable-zone(ch0page00tool1)*/Draw/*#-end-localizable-zone*/", emojiIcon: "🖌")
emojiTool.onTouchMoved = addEmoji(touch:)
scene.tools.append(emojiTool)

//#-localizable-zone(ch0page00k32)
// Create and add the Kaleido button.
//#-end-localizable-zone
let kaleidoTool = Tool(name: "/*#-localizable-zone(ch0page00tool2)*/Kaleido/*#-end-localizable-zone*/", emojiIcon: "❄️")
kaleidoTool.onTouchMoved = addKaleidoImage(touch:)
scene.tools.append(kaleidoTool)

//#-localizable-zone(ch0page00k33)
// Create and add the Play button.
//#-end-localizable-zone
let playTool = Tool(name: "/*#-localizable-zone(ch0page00tool3)*/Play/*#-end-localizable-zone*/", emojiIcon: "🎶")
playTool.onGraphicTouched = playNote(graphic:)
scene.tools.append(playTool)

//#-localizable-zone(ch0page00k34)
// Create and add the Hello button.
//#-end-localizable-zone
let helloTool = Tool(name: "/*#-localizable-zone(ch0page00tool4)*/Hello/*#-end-localizable-zone*/", emojiIcon: "🗣")
helloTool.onGraphicTouched = sayHello(graphic:)
scene.tools.append(helloTool)

//#-localizable-zone(ch0page00k35)
// Create and add the Goodbye button.
//#-end-localizable-zone
let goodbyeTool = Tool(name: "/*#-localizable-zone(ch0page00tool5)*/Goodbye/*#-end-localizable-zone*/", emojiIcon: "⚡️")
goodbyeTool.onGraphicTouched = fadeAway(graphic:)
scene.tools.append(goodbyeTool)

//#-localizable-zone(ch0page00k36)
// Create and connect the Dance button.
//#-end-localizable-zone
let danceButton = Button(name: "/*#-localizable-zone(ch0page00tool6)*/Astrodance/*#-end-localizable-zone*/")
danceButton.onPress = dance
scene.button = danceButton
//#-end-editable-code
//#-hidden-code

playgroundEpilogue()

//#-end-hidden-code
