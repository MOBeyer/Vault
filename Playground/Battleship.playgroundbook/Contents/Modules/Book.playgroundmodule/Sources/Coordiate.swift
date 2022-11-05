//
//  Coordiate.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation

/// Each coordinate has a row and a column value. Use coordinates to specify locations on the grid.
/// - localizationKey: Coordinate
public struct Coordinate {
    /// The row value of the coordinate.
    /// - localizationKey: Coordinate.row
    public let row: Int
    /// The column value of the coordinate.
    /// - localizationKey: Coordinate.column
    public let column: Int
    
    init() {
        row = 0
        column = 0
    }
    
    /// An invalid coordinate used to specify that the desired coordinate doesn’t exist.
    /// - localizationKey: Coordinate.invalid
    public static let invalid = Coordinate(column: -1, row: -1)
    
    /// Initializer method for a creating a ``Coordinate``.
    ///
    /// - parameter column: The coordinate’s column.
    /// - parameter row:    The coordinate’s row.
    ///
    /// - returns: The new coordinate object.
    /// - localizationKey: Coordinate.init
    public init(column: Int, row: Int) {
        self.column = column
        self.row = row
    }
    
    /// Gets the neighboring coordinate in a given direction.
    ///
    /// - parameter direction: The direction of the neighbor to get.
    ///
    /// - returns: The coordinate of the neighboor in the given direction.
    /// - localizationKey: Coordinate.neighbor(inDirection:)
    public func neighbor(inDirection direction: Direction) -> Coordinate {
        return advanced(by: 1, inDirection: direction)
    }
    
    /// Gets a coordinate that is offset in a given direction from the current coordinate.
    ///
    /// - parameter displacement: The offset from the current coordinate.
    /// - parameter direction:    The direction of the offset from the current coordinate.
    ///
    /// - returns: The coordinate that is offset in a given direction from the current coordinate.
    /// - localizationKey: Coordinate.advanced(by:inDirection:)
    public func advanced(by displacement: Int, inDirection direction: Direction) -> Coordinate {
        switch direction {
        case .north:
            return Coordinate(column: column, row: row + displacement)
        case .south:
            return Coordinate(column: column, row: row - displacement)
        case .east:
            return Coordinate(column: column + displacement, row: row)
        case .west:
            return Coordinate(column: column - displacement, row: row)
        }
    }
}

extension Coordinate: CustomStringConvertible {
    
    public var description: String {
        return "column \(column), row \(row)"
    }
}

extension Coordinate: Equatable {}

public func ==(c1: Coordinate, c2: Coordinate) -> Bool {
    return c1.row == c2.row && c1.column == c2.column
}
