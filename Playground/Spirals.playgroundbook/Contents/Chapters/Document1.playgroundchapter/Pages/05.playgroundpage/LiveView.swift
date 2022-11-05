//
//  LiveView.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import PlaygroundSupport
import UIKit
import Book

let page = PlaygroundPage.current

page.liveView = SpiralViewController(initialRoulette: Roulette(trackRadius: 5.0,
                                                               wheelRadius: 3.0,
                                                               spokeLength: 5.0,
                                                               pathColor: UIColor.appleLogoOrange(),
                                                               trackColor: UIColor.appleLogoPurple(),
                                                               spokeColor: UIColor.appleLogoRed(),
                                                               wheelColor: UIColor.appleLogoBlue()))

