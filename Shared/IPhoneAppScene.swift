//
//  iPhoneAppScene.swift
//  plantatinhas
//
//  Created by Paulo Uchôa on 21/05/21.
//

import SwiftUI

struct IPhoneAppScene: Scene {
    
    var body: some Scene {
        
        let persistenceController = PersistenceController.shared
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
}
