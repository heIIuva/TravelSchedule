//
//  StationModel.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import Foundation

struct Station: Identifiable, Hashable, Sendable {
    let id = UUID()
    let title: String
    let code: String
}
