//
//  ContentView.swift
//  TravelSchedule
//
//  Created by big stepper on 18.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var searchMachine = SearchMachine()
    @StateObject private var citiesViewModel = CitiesViewModel()
    @StateObject private var scheduleViewModel = ScheduleViewModel()
    @StateObject private var settingsViewModel = SettingsViewModel()
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        RouterView {
            TabView {
                VStack {
                    ScheduleView()
                }
                .tabItem {
                    Image(.scheduleTab)
                }
                .tag(0)
                VStack {
                    SettingsView(isDarkMode: settingsViewModel.isDarkMode)
                }
                .tabItem {
                    Image(.settingsTab)
                }
                .tag(1)
            }
            .tint(.tabAccent)
        }
        .environmentObject(searchMachine)
        .environmentObject(citiesViewModel)
        .environmentObject(scheduleViewModel)
        .environmentObject(settingsViewModel)
        .environment(\.colorScheme, settingsViewModel.isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
