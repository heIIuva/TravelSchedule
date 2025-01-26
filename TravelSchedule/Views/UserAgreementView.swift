//
//  UserAgreementView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

struct UserAgreementView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        UserAgreementWebView(url: Constants.practicumURL)
            .navigationTitle("Пользовательское соглашение")
            .toolbarRole(.editor)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        router.pop()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 11, height: 19)
                            .font(Font.title.weight(.semibold))
                    }
                    .tint(.tabAccent)
                }
            }
    }
}

#Preview {
    UserAgreementView()
}
