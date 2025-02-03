//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by big stepper on 03.02.2025.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    
    init() {
        self.isDarkMode = store.bool(forKey: "isDarkMode")
        self.url = Constants.practicumURL
    }
    
    private let store = UserDefaults.standard
    
    @Published var isDarkMode: Bool
    @Published private(set) var url: String
            
    func toggleDarkMode() {
        isDarkMode.toggle()
        store.set(isDarkMode, forKey: "isDarkMode")
    }
}
