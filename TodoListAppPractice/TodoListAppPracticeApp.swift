//
//  TodoListAppPracticeApp.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 26.12.2023.
//

import SwiftUI

@main
struct TodoListAppPracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
