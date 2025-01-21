//
//  LoadingState.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import Foundation

enum LoadingState {
    case loading
    case loaded
    case error(ErrorType)
}

final class LoadingStateMachine: ObservableObject {
    @Published var state: LoadingState = .loading
}
