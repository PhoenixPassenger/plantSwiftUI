//
//  plantatinhasApp.swift
//  plantatinhas Extension
//
//  Created by Rodrigo Silva Ribeiro on 11/05/21.
//

import SwiftUI

@main
struct plantatinhasApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
