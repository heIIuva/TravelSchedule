//
//  DateFormatter+Extensions.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import Foundation


extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()
    
    static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        return formatter
    }()
}
