//
//  PathModel.swift
//  TravelSchedule
//
//  Created by big stepper on 22.01.2025.
//

import Foundation

struct Path: Identifiable, Hashable {
    let id = UUID()
    let carrier: CarrierInfo
    let transfer: String?
    let departure: String
    let arrival: String
    let startDate: String
    let hasTransfers: Bool
    let shortTitle: String
    let carrierLogo: String
}
