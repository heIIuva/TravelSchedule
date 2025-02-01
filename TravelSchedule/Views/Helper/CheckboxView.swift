//
//  CheckboxView.swift
//  TravelSchedule
//
//  Created by big stepper on 24.01.2025.
//

import SwiftUI

struct CheckboxView: ToggleStyle {
    
    let style: CheckboxStyle
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            switch style {
            case .checkbox:
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(.ypUniversal)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            case .circle:
            Image(systemName: configuration.isOn ? "circle.inset.filled" : "circle")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(.ypUniversal)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            }
        }
    }
}

