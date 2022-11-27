//
//  Results.swift
//  Project 7
//
//  Created by Moritz Beyer on 04.01.22.
//  Copyright © 2022 Moritz Beyer. All rights reserved.
//

import Foundation


// the main JSON contains the results array. and each item in that array is a Petition
struct Petitions: Codable {
    var results: [Petition]
}
