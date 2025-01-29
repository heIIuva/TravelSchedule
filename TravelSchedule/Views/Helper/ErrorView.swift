//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

struct ErrorView: View {
    let type: ErrorType
    
    var body: some View {
        let model = type.setupErrorModel()
        VStack {
            model.image
            Text(model.description)
                .font(.bold24)
        }
    }
}

#Preview {
    ErrorView(type: .serverError)
}
