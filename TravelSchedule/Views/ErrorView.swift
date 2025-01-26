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
                .font(.system(size: 24, weight: .bold))
        }
    }
}

#Preview {
    ErrorView(type: .serverError)
}
