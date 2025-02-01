//
//  CloseButton.swift
//  TravelSchedule
//
//  Created by big stepper on 30.01.2025.
//

import SwiftUI

struct CloseButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: { action() }, label: {
            Image("closeButton")
        })
    }
}
