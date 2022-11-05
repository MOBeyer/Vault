//
//  Int+OddEven.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation

public extension Int {
    /// Returns ``true`` if the Int is odd.
    /// - localizationKey: Int.isOdd
    var isOdd: Bool {
        return (self % 2) == 1
    }
    /// Returns ``true`` if the Int is even.
    /// - localizationKey: Int.isEven
    var isEven: Bool {
        return !isOdd
    }
}
