//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isDarkMode: Bool
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Toggle("Темная тема", isOn: $isDarkMode)
                .toggleStyle(SwitchToggleStyle(tint: Color.blue))
            ListRowView(text: "Пользовательское соглашение")
                .foregroundStyle(.foreground)
                .onTapGesture {
                    router.push(.goToUserAgreementView)
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
    SettingsView(isDarkMode: .constant(false))
}
