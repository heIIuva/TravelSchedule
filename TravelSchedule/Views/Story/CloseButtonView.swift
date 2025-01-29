//
//  CloseButtonView.swift
//  TravelSchedule
//
//  Created by big stepper on 29.01.2025.
//

import SwiftUI

struct CloseButtonView: View {
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                action()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .font(Font.title.weight(.semibold))
            }
            .tint(Color.black)
        }
    }
}

#Preview {
    CloseButtonView(action: {print("")})
}
