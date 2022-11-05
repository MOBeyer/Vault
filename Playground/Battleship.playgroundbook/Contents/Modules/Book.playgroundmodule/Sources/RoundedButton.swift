//
//  RoundedButton.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import UIKit

@objc(RoundedButton)
class RoundedButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
    }
}
