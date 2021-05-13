//
//  plantatinhasApp.swift
//  Shared
//
//  Created by Rodrigo Silva Ribeiro on 11/05/21.
//

import SwiftUI

@main
struct PlantatinhasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
