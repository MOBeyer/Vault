//
//  File.swift
//  My App
//
//  Created by Moritz Beyer on 31.03.22.
//

import SwiftUI

struct ButtonStyleView: View {
    var body: some View {
        Button {
            print("Someone poked me!")
        } label: {
            HStack {
                Text("POKE ME")
                
                Spacer()
                
                Text("DO IT")
            }
        }
        .buttonStyle(MyButtonStyle())
        .frame(width: 200.0)
        .background(Color.blue.opacity(0.25))
    }
}

struct ButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleView()
    }
}


struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
