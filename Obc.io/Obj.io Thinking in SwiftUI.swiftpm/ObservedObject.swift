//
//  File.swift
//  Thinking in SwiftUI
//
//  Created by Moritz Beyer on 01.03.22.
//

import SwiftUI



final class CurrentTime: ObservableObject {
    @Published var now: Date = Date()
    
    let interval: TimeInterval = 1
    private var timer: Timer? = nil
}

func start() {
    guard timer == nil else {return
        now = Date()
    }
}
