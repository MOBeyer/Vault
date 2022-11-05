//
//  LiveView.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import PlaygroundSupport
import Book

let page = PlaygroundPage.current

page.liveView = SpiralViewController(initialRoulette: Roulette(trackRadius: 5.0,
                                                               wheelRadius: 1.0,
                                                               spokeLength: 1.0))



