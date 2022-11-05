//
//  Ship.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation

/// Represents a single ship.
/// - localizationKey: Ship
public class Ship {
    // MARK: Properties
    
    /// The ship’s type (patrol boat, submarine, destroyer, battleship, or aircraft carrier).
    /// - localizationKey: Ship.classification
    public let classification: ShipClassification
    
    /// The amount of times the ship has been hit. A ship is considered sunk when the amount of damage equals its length.
    /// - localizationKey: Ship.damage
    public internal(set) var damage = 0
    
    /// Returns ``true`` if the ship is sunk.
    /// - localizationKey: Ship.isSunk
    public var isSunk: Bool {
        return damage == classification.length
    }
    
    // MARK: Initialization
    
    init(ofClassification classification: ShipClassification) {
        self.classification = classification
    }
}

/// Represents a type of ship (patrol boat, submarine, destroyer, battleship, or aircraft carrier).
/// - localizationKey: ShipClassification
public enum ShipClassification: CaseIterable {
    /// A two tile long ship
    /// - localizationKey: ShipClassification.patrolBoat
    case patrolBoat
    /// A three tile long ship
    /// - localizationKey: ShipClassification.submarine
    case submarine
    /// A three tile long ship
    /// - localizationKey: ShipClassification.destroyer
    case destroyer
    /// A four tile long ship
    /// - localizationKey: ShipClassification.battleship
    case battleship
    /// A five tile long ship
    /// - localizationKey: ShipClassification.aircraftCarrier
    case aircraftCarrier
    
    /// The length in titles of the ship.
    /// - localizationKey: ShipClassification.length
    public var length: Int {
        switch self {
        case .patrolBoat:
            return 2
            
        case .submarine:
            return 3
            
        case .destroyer:
            return 3
            
        case .battleship:
            return 4
            
        case .aircraftCarrier:
            return 5
        }
    }
}
