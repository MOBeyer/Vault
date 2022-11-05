//
//  Orientation.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation

/// An enum representing possible ship orientations.
/// - localizationKey: Orientation
public enum Orientation: Int {
    case horizontal
    case vertical
    
    static func random() -> Orientation {
        return Orientation(rawValue: Int.random(in: 0...1))!
    }
    
    init(from: Coordinate, to: Coordinate) {
        if from.row == to.row {
            self = .horizontal
        }
        else if from.column == to.column {
            self = .vertical
        }
        else {
            fatalError("Diagonal orientaions not supported")
        }
    }
}
