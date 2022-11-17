//
//  ViewModel.swift
//  My App
//
//  Created by Moritz Beyer on 11.11.22.
//

import Foundation

struct ViewModel {
    var beatles = ["John", "Paul", "George", "Ringo"]
    let numbers = [4, 8, 15, 16, 23, 42]
    var temperatures = [25.3, 28.2, 26.4]

    mutating func append() {
        beatles.append("Adrian")
        print(beatles)
    }
}
