//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

private var trackRadius = 5.0
private var wheelRadius = 1.0
private var spokeLength = 1.0
private var pathColor = UIColor.appleLogoGreen()
private var trackColor = UIColor.appleLogoRed()
private var spokeColor = UIColor.appleLogoOrange()
private var wheelColor = UIColor.appleLogoYellow()

// New vars
private var backgroundColor = UIColor.wwdcGray()
private var drawSpeed = 1.0
private var lightTheme = false

func drawSpiral() {
    let cycloid = Roulette(trackRadius: trackRadius,
                           wheelRadius: wheelRadius,
                           spokeLength: spokeLength,
                             pathColor: pathColor,
                            trackColor: trackColor,
                            spokeColor: spokeColor,
                            wheelColor: wheelColor,
                            drawSpeed: drawSpeed,
                            lightTheme: lightTheme,
                            backgroundColor: backgroundColor)
    proxy?.send(cycloid.playgroundValue)
}

//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Have fun! 😃
 
 Congratulations! You’ve mastered Spirals! Use this page to play and draw as much as you like. You’ll even find a few new customization options towards the bottom of the page.
 
 Take a picture of your art, a movie of it, or even stream it live using one of your own livestreaming apps! Show your friends the cool spirals you’ve created!
 */
//#-code-completion(everything, hide)
//#-code-completion(literal, show, color)
//#-editable-code
//#-localizable-zone(page07k01)
// This will determine how large the track your wheel moves on is.
//#-end-localizable-zone
trackRadius = 5

//#-localizable-zone(page07k02)
// Remember to use a negative value here to draw an epi- shape.
//#-end-localizable-zone
wheelRadius = 1

//#-localizable-zone(page07k03)
// Make spokeLength equal to the wheelRadius for a cycloid, or not equal for a trochoid.
//#-end-localizable-zone
spokeLength = 1

pathColor = #colorLiteral(red: 0.3823705912, green: 0.7347578406, blue: 0.2736029625, alpha: 1)
trackColor = #colorLiteral(red: 0.8941176471, green: 0.2117647059, blue: 0.2431372549, alpha: 1)
spokeColor = #colorLiteral(red: 0.9607843137, green: 0.5098039216, blue: 0.1215686275, alpha: 1)
wheelColor = #colorLiteral(red: 0.9921568627, green: 0.7215686275, blue: 0.1529411765, alpha: 1)

//#-localizable-zone(page07k04)
// Try some of the new options below!
//#-end-localizable-zone
backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.09411764706, blue: 0.1333333333, alpha: 1)

//#-localizable-zone(page07k05)
// For best results, choose a draw speed value from 1.0 to 10.0
//#-end-localizable-zone
drawSpeed = 1.0

//#-localizable-zone(page07k06)
// Note: Setting lightTheme to true will override backgroundColor.
//#-end-localizable-zone
lightTheme = false

drawSpiral()
//#-end-editable-code
