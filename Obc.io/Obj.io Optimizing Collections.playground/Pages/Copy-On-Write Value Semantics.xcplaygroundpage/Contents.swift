//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Copy-On-Write Value Semantics

var a = [2, 3, 4]
let b = a
a.insert(1, at: 0)
a
b



// The SortedSet Protocol

public protocol SortedSet: BidirectionalCollection, SetAlgebra {
    associatedtype Element: Comparable
}

// Semantic Requirements

// Printing Sorted Sets

extension SortedSet {
    public var description: String {
        let contents = self.lazy.map { "\($0)" }.joined(separator: ",")
        return "[\(contents)]"
    }
}

#if os(iOS)
import UIKit

extension PlaygroundQuickLook {
    public static func monospacedText(_ string: String) -> PlaygroundQuickLook {
        let text = NSMutableAttributedString(string: string)
        let range = NSRange(location: 0, length: text.length)
        let style = NSParagraphStyle.default.mutableCopy()as! NSParagraphStyle
        
//        style.lineSpacing = 0
//        style.alignment = .left
//        style.maximumLineHeight = 17
        
        
        text.addAttribute(.font, value: UIFont(name: "Menlo", size: 13)!, range: range)
        return _PlaygroundQuickLook.attributedString(text)
    }
}
#endif
//
