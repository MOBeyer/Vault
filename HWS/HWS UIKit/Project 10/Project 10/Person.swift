//
//  Person.swift
//  Project 10
//
//  Created by Moritz Beyer on 08.01.22.
//  Copyright © 2022 Moritz Beyer. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

}
