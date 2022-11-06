//
//  File.swift
//  Thinking in SwiftUI
//
//  Created by Moritz Beyer on 01.03.22.
//

import SwiftUI

struct BridgeEuropeMainView: View {
    @State var diversityOfIdeas = false
    @State var listeningCommunities = false
    @State var responsibleDiscourse = false
    @State var globalMindset = false
    
    var body: some View {
        ScrollView {
            
            VStack {
                Text("Bridge Europe")
                
                Spacer()
                
                
                Text("Together We Build Bridges")
                
                Text("On Campuses, in Europe and in the World")
                
                Spacer()
                
                Text("Political polarization and gridlock have impeded progress for too long. We are a global movement of students whose aim is to build bridges between citizens who have been geographically or ideologically divided for too long. We are building a network of students and young citizens in Europe - and around the world - to come together and discuss the most pressing challenges of our time. Our principles guide our actions - at our local student organizations and on the European level: We champion ideological diversity, promote responsible and solution-oriented discourse and believe in a global mindset.")
                
                HStack {
                    Button("Diversity of Ideas") {
                        print("Test")
                    }
                    
                    Button("Diversity of Ideas") {
                        print("Test")
                    }
                    
                    Button("Diversity of Ideas") {
                        print("Test")
                    }
                    
                    Button("Diversity of Ideas") {
                        print("Test")
                        
                        VStack {
                            Button("Learn More About US") {
                                print("Test")
                                
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct BridgeEuropeMainView_Previews: PreviewProvider {
    static var previews: some View {
        BridgeEuropeMainView()
    }
}

struct SampleSheetView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
