//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Create a tool to speak when you touch a graphic.
 
Whenever you call `speak(_:)`, the [speech synthesizer](glossary://speech%20synthesis) speaks the string you pass as a parameter.
 
 * callout(Speaking a string):
    `speak("Hello!")`
 
 In the code, the `speakText(graphic:)` function speaks the text of a graphic created with a string. You can set a tool’s `onGraphicTouched` property to this function using its [full function name](glossary://full%20function%20name).
 
 * callout(Example):
    `speakTool.onGraphicTouched = speakText(graphic:)`
 
 `speakText(graphic:)` is now called each time you touch a graphic.
 
 1. Add a **Speak** tool and set `speakText(graphic:)` as its “graphic touched” event handler.
 2. Run the code and use the **Fruit** and **Greeting** tools to place some graphics on the scene.
 3. Select your new **Speak** tool and touch any graphic.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(module, show, MyFiles)
//#-code-completion(literal, show, array, color, image)
//#-code-completion(identifier, show, if, for, while, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, %, "", true, false, &&, ||, !, *, /, scene, ., backgroundColor, backgroundImage, Graphic, text:), text:, (text:), text:, image:), image:, (image:), image:, (, ), Point, x:y:), (x:y:), x:y:, place(_:at:), randomInt(from:to:), randomDouble(from:to:), x, y, scale, insert(_:at:), remove(at:), append(_:), removeAll(), removeFirst(), removeLast(), count, numberOfObjectsPlaced, previousPlaceDistance, position, speed, fadeOut(after:), spinAndPop(after:), swirlAway(after:), move(to:duration:), circlePoints(radius:count:), spiralPoints(spacing:count:), abs(_:), write(_:), speak, fontName, fontSize, rotation, textColor, avenirNext, bradleyHand, chalkduster, georgia, helveticaNeue, markerfelt, menlo, zapfino, componentsByCharacter(), randomItem, orbit(x:y:period:), tools, Tool, name:emojiIcon:), (name:emojiIcon:), name:emojiIcon:, onTouchMoved, onGraphicTouched, rotation)
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
        guard let sceneTools = assessmentInfo["tools"] as? [Tool] else { return nil }
        
        for event in assessmentInfo.events {
            if case .speak(_) = event {
                if sceneTools.count >= 3 {
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

/// Speaks the given text.
///
/// - Parameter text: The text to be spoken.
///
/// - localizationKey: speak2(_:)
func speak(_ text: String) {
    
    stopSpeaking()
    
    var voice = SpeechVoice(accent: .american)
    voice.pitch = 40
    voice.speed = 20
    
    speak(text, voice: voice)
}

scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheGreenFrontier@2x.png")
//#-end-hidden-code
//#-editable-code
//#-localizable-zone(ch4page05k1)
// Speak the text of graphic.
//#-end-localizable-zone
func speakText(graphic: Graphic) {
    speak(graphic.text)
}

//#-localizable-zone(ch4page05k2)
// With the Fruit tool selected, this function is called each time you move your touch.
//#-end-localizable-zone
func addFruit(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let fruit = "🍏🍐🍊🍋🍉🍒🍓🍌".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphic.scale = 1.5
}

//#-localizable-zone(ch4page05k3)
// With the Greeting tool selected, this function is called each time you move your touch.
//#-end-localizable-zone
func addGreeting(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let greetings = ["/*#-localizable-zone(ch4page05greeting1)*/howdy!/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page05greeting2)*/hello/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page05greeting3)*/hi/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page05greeting4)*/ciao/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page05greeting5)*/yo!/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page05greeting6)*/hey!/*#-end-localizable-zone*/", "/*#-localizable-zone(ch4page05greeting7)*/what’s up?/*#-end-localizable-zone*/"]
    let greeting = greetings.randomItem
    let graphic = Graphic(text: greeting)
    graphic.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    graphic.fontName = .chalkduster
    scene.place(graphic, at: touch.position)
    graphic.rotation = randomDouble(from: -30, to: 30)
}

//#-localizable-zone(ch4page05k4)
// Create and add Fruit tool.
//#-end-localizable-zone
let fruitTool = Tool(name: "/*#-localizable-zone(ch4page05fruitTool)*/Fruit/*#-end-localizable-zone*/", emojiIcon: "🍒")
fruitTool.onTouchMoved = addFruit(touch:)
scene.tools.append(fruitTool)

//#-localizable-zone(ch4page05k5)
// Create and add Greeting tool.
//#-end-localizable-zone
let greetingTool = Tool(name: "/*#-localizable-zone(ch4page05greetingTool)*/Greeting/*#-end-localizable-zone*/", emojiIcon: "🙏")
greetingTool.onTouchMoved = addGreeting(touch:)
scene.tools.append(greetingTool)

//#-localizable-zone(ch4page05k6)
// ✏️ Create and add Speak tool.
//#-end-localizable-zone


//#-end-editable-code
//#-hidden-code
assessmentController?.customInfo["tools"] = scene.tools

playgroundEpilogue()

//#-end-hidden-code
