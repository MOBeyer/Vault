//
//  AppApp.swift
//  App
//
//  Created by Moritz Beyer on 05.11.22.
//

import SwiftUI

@main
struct AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
