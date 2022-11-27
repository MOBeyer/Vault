//
//  File.swift
//  Shopping List
//
//  Created by Moritz Beyer on 12.01.22.
//  Copyright © 2022 Moritz Beyer. All rights reserved.
//

import Foundation

class AddItem: NSCoding {
    
    var testItem = [String]()
    
    init(item: [String]) {
        self.testItem = item
    }
    
    required init(coder aDecoder: NSCoder) {
        testItem = aDecoder.decodeObject(forKey: "item") as! [String]
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(testItem, forKey: "item")
    }
}
