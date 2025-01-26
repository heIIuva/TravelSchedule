//
//  ErrorModel.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
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
