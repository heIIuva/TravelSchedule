//
//  UserAgreementView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

struct UserAgreementView: View {
    var body: some View {
        UserAgreementWebView(url: Constants.practicumURL)
            .toolbar(.hidden, for: .tabBar)
            .toolbarRole(.editor)
            .navigationTitle("Пользовательское соглашение")
    }
}

#Preview {
    UserAgreementView()
}
