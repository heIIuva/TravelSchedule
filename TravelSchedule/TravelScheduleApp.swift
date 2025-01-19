//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by big stepper on 18.01.2025.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    @State private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(isDarkMode: $isDarkMode)
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }
}
