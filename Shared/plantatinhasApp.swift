//
//  plantatinhasApp.swift
//  Shared
//
//  Created by Rodrigo Silva Ribeiro on 11/05/21.
//

import SwiftUI

@main
struct PlantatinhasApp: App {

    var body: some Scene {
            #if os(watchOS)
            WatchAppScene()
            #else
            IPhoneAppScene()
            #endif
    }
}
