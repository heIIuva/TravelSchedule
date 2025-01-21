//
//  SearchMachine.swift
//  TravelSchedule
//
//  Created by big stepper on 21.01.2025.
//

import Foundation


final class SearchMachine: ObservableObject {
    
    @Published var departureCity = ""
    @Published var destinationCity = ""
    @Published var departureStations = ""
    @Published var destinationStations = ""
    @Published var departureText = ""
    @Published var destinationText = ""
    
    func swapDirections() {
        (departureText, destinationText) = (destinationText, departureText)
    }
    
    func departure() {
        departureText = "\(departureCity) \(departureStations)"
    }
    
    func destination() {
        destinationText = "\(destinationCity) \(destinationStations)"
    }
}
