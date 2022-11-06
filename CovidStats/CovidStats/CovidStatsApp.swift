//
//  CovidStatsApp.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import SwiftUI

@main
struct CovidStatsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
