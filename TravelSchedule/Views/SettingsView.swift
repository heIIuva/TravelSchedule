//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Темная тема", isOn: $isDarkMode)
                    .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                NavigationLink(destination: UserAgreementView()) {
                    ListRowView(text: "Пользовательское соглашение")
                }
                .foregroundStyle(.foreground)
            }
            .padding(.top, 24)
            .padding(.horizontal)
            Spacer()
            VStack(spacing: 16) {
                Text("Приложение использует API «Яндекс.Расписания»")
                Text("Версия 1.0 (beta)")
            }
            .font(.system(size: 12, weight: .regular))
        }
        .padding(.bottom, 24)
        Divider()
            .padding(.bottom, 10)
    }
}

#Preview {
    SettingsView(isDarkMode: .constant(false))
}
