//
//  ContentView.swift
//  TravelSchedule
//
//  Created by big stepper on 18.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var searchMachine = SearchMachine()
    @StateObject private var viewModel = CitiesViewModel()
    
    @Binding var isDarkMode: Bool
    @State private var selectedTab: Int = 0
        
    var body: some View {
        RouterView {
            TabView {
                VStack {
                    ScheduleView(viewModel: viewModel)
                }
                .tabItem {
                    Image(.scheduleTab)
                }
                .tag(0)
                VStack {
                    SettingsView(isDarkMode: $isDarkMode)
                }
                .tabItem {
                    Image(.settingsTab)
                }
                .tag(1)
            }
            .tint(.tabAccent)
        }
        .environmentObject(searchMachine)
    }
}

#Preview {
    ContentView(isDarkMode: .constant(false))
}
