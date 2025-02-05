//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

struct SettingsView: View {
    
    init(isDarkMode: Bool) {
        self.isDarkMode = isDarkMode
    }
    
    @State private var isDarkMode: Bool
        
    @EnvironmentObject var viewModel: SettingsViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Toggle("Темная тема", isOn: $isDarkMode)
                .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                .onChange(of: isDarkMode) {
                    withAnimation(.smooth(duration: 1)) {
                        viewModel.toggleDarkMode()
                    }
                }
            ListRowView(text: "Пользовательское соглашение")
                .foregroundStyle(.foreground)
                .onTapGesture {
                    router.push(.goToUserAgreementView(viewModel.url))
                }
        }
        .padding(.top, 24)
        .padding(.horizontal)
        Spacer()
        VStack(spacing: 16) {
            Text("Приложение использует API «Яндекс.Расписания»")
            Text("Версия 1.0 (beta)")
        }
        .font(.regular12)
        .padding(.bottom, 24)
        Divider()
            .padding(.bottom, 10)
    }
}

#Preview {
    SettingsView(isDarkMode: false)
}
