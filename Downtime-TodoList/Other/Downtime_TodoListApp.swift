//
//  Downtime_TodoListApp.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import FirebaseCore
import SwiftUI

@main
struct Downtime_TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
