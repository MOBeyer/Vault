//
//  Roulette.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import PlaygroundSupport
import UIKit

/// Enum for the specific types of roulettes you might make
/// - localizationKey: RouletteType
public enum RouletteType {
    case hypocycloid
    case epicycloid
    case hypotrochoid
    case epitrochoid
    case ellipse
}

/** 
 Roulette is a wrapper class which contains all user-facing variables and functions
 and is used to wrap and send playgroundValues between the Contents file and LiveView
  - localizationKey: Roulette
 */
public struct Roulette {
    
    // MARK: Internal properties
    
    var trackRadius: Double
    var wheelRadius: Double
    var spokeLength: Double
    
    /// The color used to draw the roulette’s fixed circle, or track
    var trackStrokeColor = UIColor.appleLogoGreen()
    
    /// The color used to fill in the roulette’s fixed circle, or track. Always clear
    let trackFillColor = UIColor.clear
    
    /// The color used to draw the roulette’s moving circle, or wheel
    var wheelStrokeColor = UIColor.appleLogoYellow()
    
    /// The color used to fill in the roulette’s moving circle, or wheel. Always clear
    let wheelFillColor = UIColor.clear
    
    /// The color used to draw the roulette’s spoke
    var spokeColor = UIColor.appleLogoOrange()
    
    /// The color used to draw the path inscribed by the roulette’s spoke. 
    /// This is the actual “roulette”
    var pathColor = UIColor.appleLogoBlue()
    
    /// Computed roulette type based on radii and spoke length
    var rouletteType: RouletteType {
        let absTrackRadius = abs(trackRadius)
        let absWheelRadius = abs(wheelRadius)
        let absSpokeLength = abs(spokeLength)
        
        if (wheelRadius > 0 && trackRadius > 0) ||
            (trackRadius < 0 && wheelRadius < 0) {
            if (absTrackRadius / 2.0 == absWheelRadius) && (absSpokeLength != absWheelRadius) {
                return .ellipse
            } else {
                if absSpokeLength == absWheelRadius {
                    return .hypocycloid
                } else {
                    return .hypotrochoid
                }
            }
        } else {
            if absSpokeLength == absWheelRadius {
                return .epicycloid
            } else {
                return .epitrochoid
            }
        }
    }
    
    // Extra fun customization properties
    var drawSpeed = 1.0
    var lightTheme = false
    var backgroundColor = UIColor.wwdcGray()
    
    private static let trackKey = "track"
    private static let wheelKey = "wheel"
    private static let spokeKey = "spoke"
    private static let pathColorKey = "pathColor"
    private static let trackColorKey = "trackColor"
    private static let spokeColorKey = "spokeColor"
    private static let wheelColorKey = "wheelColor"
    private static let drawSpeedKey = "drawSpeed"
    private static let lightThemeKey = "lightTheme"
    private static let backgroundColorKey = "backgroundColor"
    
    /// The default values here will produce a hypotrochoid
    public init(trackRadius: Double = 5.0,
                wheelRadius: Double = 3.0,
                spokeLength: Double = 10.0,
                pathColor: UIColor = .appleLogoBlue(),
                trackColor: UIColor = .appleLogoGreen(),
                spokeColor: UIColor = .appleLogoOrange(),
                wheelColor: UIColor = .appleLogoYellow(),
                drawSpeed: Double = 1.0,
                lightTheme: Bool = false,
                backgroundColor: UIColor = .wwdcGray()) {
        self.trackRadius = trackRadius
        self.wheelRadius = wheelRadius
        self.spokeLength = spokeLength
        self.trackStrokeColor = trackColor
        self.pathColor = pathColor
        self.drawSpeed = drawSpeed
        self.lightTheme = lightTheme
        self.wheelStrokeColor = wheelColor
        self.spokeColor = spokeColor
        self.backgroundColor = backgroundColor
        
        if lightTheme {
            self.backgroundColor = UIColor.white
            self.pathColor = pathColor.lighterColor
            self.trackStrokeColor = trackStrokeColor.lighterColor
            self.wheelStrokeColor = wheelStrokeColor.lighterColor
            self.spokeColor = spokeColor.lighterColor
        }
    }
    
    public init(playgroundValue: PlaygroundValue) {
        guard case let .dictionary(dict) = playgroundValue else {
            self.init()
            return
        }
        
        guard case let .floatingPoint(track)? = dict[Roulette.trackKey] else {
            self.init()
            return
        }
        
        guard case let .floatingPoint(wheel)? = dict[Roulette.wheelKey] else {
            self.init()
            return
        }
        
        guard case let .floatingPoint(spoke)? = dict[Roulette.spokeKey] else {
            self.init()
            return
        }
        
        guard case let .data(pathColorData)? = dict[Roulette.pathColorKey],
            let pathColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: pathColorData) else {
                self.init()
                return
        }
        
        guard case let .data(trackColorData)? = dict[Roulette.trackColorKey],
            let trackColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: trackColorData) else {
                self.init()
                return
        }
        
        guard case let .data(spokeColorData)? = dict[Roulette.spokeColorKey],
            let spokeColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: spokeColorData) else {
                self.init()
                return
        }
        
        guard case let .data(wheelColorData)? = dict[Roulette.wheelColorKey],
            let wheelColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: wheelColorData) else {
                self.init()
                return
        }
        
        guard case let .floatingPoint(speed)? = dict[Roulette.drawSpeedKey] else {
            self.init()
            return
        }
        
        guard case let .boolean(lightTheme)? = dict[Roulette.lightThemeKey] else {
            self.init()
            return
        }
        
        guard case let .data(backgroundColorData)? = dict[Roulette.backgroundColorKey],
            let backgroundColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: backgroundColorData) else {
                self.init()
                return
        }
        
        self.init(trackRadius: track,
                  wheelRadius: wheel,
                  spokeLength: spoke,
                    pathColor: pathColor,
                   trackColor: trackColor,
                   spokeColor: spokeColor,
                   wheelColor: wheelColor,
                   drawSpeed: speed,
                   lightTheme: lightTheme,
                   backgroundColor: backgroundColor)
    }
    
    /// A Hypocycloid is defined as a roulette where the wheel moves along 
    /// the *interior* of the track, and the spoke length is equal to the wheel radius
    public static func hypocycloid() -> Roulette {
        return Roulette(trackRadius: 6.0,
                       wheelRadius: 1.0,
                       spokeLength: 1.0,
                       pathColor: .appleLogoBlue(),
                       trackColor: .appleLogoRed(),
                       spokeColor: .appleLogoPurple(),
                       wheelColor: .appleLogoYellow())
    }
    
    /// An Epicycloid is defined as a roulette where the wheel moves along 
    /// the *exterior* of the track, and the spoke length is equal to the wheel radius
    public static func epicycloid() -> Roulette {
        return Roulette(trackRadius: 6.0,
                       wheelRadius: -1.0,
                       spokeLength: 1.0,
                       pathColor: .appleLogoBlue(),
                       trackColor: .appleLogoRed(),
                       spokeColor: .appleLogoPurple(),
                       wheelColor: .appleLogoYellow())
    }
    
    /// A Hypotrochoid is defined as a roulette where the wheel moves along 
    /// the *interior* of the track, and the spoke length is *not* equal to the wheel radius
    public static func hypotrochoid() -> Roulette {
        return Roulette(trackRadius: 5.0,
                       wheelRadius: 3.0,
                       spokeLength: 5.0,
                       pathColor: .appleLogoBlue(),
                       trackColor: .appleLogoRed(),
                       spokeColor: .appleLogoPurple(),
                       wheelColor: .appleLogoYellow())
    }
    
    /// An Epitrochoid is defined as a roulette where the wheel moves along 
    /// the *exterior* of the track, and the spoke length is *not* equal to the wheel radius
    public static func epitrochoid() -> Roulette {
        return Roulette(trackRadius: 5.0,
                       wheelRadius: -3.0,
                       spokeLength: 5.0,
                       pathColor: .appleLogoBlue(),
                       trackColor: .appleLogoRed(),
                       spokeColor: .appleLogoPurple(),
                       wheelColor: .appleLogoYellow())
    }
    
    /** 
     An Ellipse is defined as a roulette where the wheel moves along 
     the *interior* of the track, the track radius is 2x the wheel radius, 
     and the spoke length is *not* equal to the wheel radius.
     */
    public static func ellipse() -> Roulette {
        return Roulette(trackRadius: 6.0,
                       wheelRadius: 3.0,
                       spokeLength: 2.0,
                       pathColor: .appleLogoBlue(),
                       trackColor: .appleLogoRed(),
                       spokeColor: .appleLogoGreen(),
                       wheelColor: .appleLogoYellow())
    }
    
    /// This function returns a playgroundValue type object for its roulette
    public var playgroundValue: PlaygroundValue {
        do {
            let pathColorData = try NSKeyedArchiver.archivedData(withRootObject: pathColor, requiringSecureCoding: true)
            let trackColorData = try NSKeyedArchiver.archivedData(withRootObject: trackStrokeColor, requiringSecureCoding: true)
            let spokeColorData = try NSKeyedArchiver.archivedData(withRootObject: spokeColor, requiringSecureCoding: true)
            let wheelColorData = try NSKeyedArchiver.archivedData(withRootObject: wheelStrokeColor, requiringSecureCoding: true)
            let backgroundColorData = try NSKeyedArchiver.archivedData(withRootObject: backgroundColor, requiringSecureCoding: true)
            return .dictionary([
                Roulette.trackKey: .floatingPoint(trackRadius),
                Roulette.wheelKey: .floatingPoint(wheelRadius),
                Roulette.spokeKey: .floatingPoint(spokeLength),
                Roulette.pathColorKey: .data(pathColorData),
                Roulette.trackColorKey: .data(trackColorData),
                Roulette.spokeColorKey: .data(spokeColorData),
                Roulette.wheelColorKey: .data(wheelColorData),
                Roulette.drawSpeedKey: .floatingPoint(drawSpeed),
                Roulette.lightThemeKey: .boolean(lightTheme),
                Roulette.backgroundColorKey: .data(backgroundColorData),
            ])
        } catch {
            return .dictionary([:])
        }
    }
}
