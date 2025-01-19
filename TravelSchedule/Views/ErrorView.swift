//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

struct ErrorModel {
    let image: Image
    let description: String
}

enum ErrorType {
    case serverError
    case connectionLost
    
    func setupErrorModel() -> ErrorModel {
        switch self {
        case .serverError:
            return ErrorModel(image: Image(.serverError),
                              description: "Ошибка сервера")
        case .connectionLost:
            return ErrorModel(image: Image(.noInternet),
                              description: "Нет интернета")
        }
    }
}

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
