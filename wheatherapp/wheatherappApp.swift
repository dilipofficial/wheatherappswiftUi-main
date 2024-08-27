//
//  wheatherappApp.swift
//  wheatherapp
//
//  Created by Dilip Kumar on 10/08/24.
//

import SwiftUI

@main
struct wheatherappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
