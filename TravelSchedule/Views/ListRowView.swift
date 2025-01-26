//
//  ListRowView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

struct ListRowView: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 17, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 11, height: 19)
                .font(Font.title.weight(.semibold))
        }
        .frame(height: 60)
        .contentShape(.rect)
    }
}

#Preview {
    ListRowView(text: "")
}
