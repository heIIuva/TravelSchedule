//
//  CityModel.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import Foundation

struct City {
    let id = UUID()
    let title: String
    let stations: [Station]
}
