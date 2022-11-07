//
//  File.swift
//  Thinking in SwiftUI
//
//  Created by Moritz Beyer on 01.03.22.
//

import SwiftUI

struct ViewBuildersView: View {
    var body: some View {
        VStack {
            Text("Hello")
            if true {
                Image(systemName: "circle")
            }
            if false {
                Image(systemName: "square")
            } else {
                Divider()
            }
            Button(action: {}, label: {
                Text("Hello")
            })
        }
    }
}

struct ViewBuildersView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuildersView()
    }
}


// View Layout

struct SwiftUILayoutSystem: View {
    var body: some View {
        VStack {
            Image(systemName: "circle")
        }
        
    }
}

struct SwiftUILayoutSystem_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILayoutSystem()
    }
}
