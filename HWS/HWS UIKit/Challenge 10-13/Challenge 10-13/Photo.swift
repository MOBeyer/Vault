//
//  Photo.swift
//  Challenge 10-13
//
//  Created by Moritz Beyer on 11.01.22.
//  Copyright © 2022 Moritz Beyer. All rights reserved.
//

import UIKit


//Custom subclasses of NSObject
class Photo: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
