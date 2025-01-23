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
    @Published var departureStation: Station = Station(title: "", code: "")
    @Published var destinationStation: Station = Station(title: "", code: "")
    @Published var departureText = ""
    @Published var destinationText = ""
    
    func swapDirections() {
        (departureText, destinationText) = (destinationText, departureText)
        (departureStation, destinationStation) = (destinationStation, departureStation)
    }
    
    func city(for direction: Directions, _ city: String) {
        switch direction {
        case .departure:
            departureCity = city
        case .destination:
            destinationCity = city
        }
    }
    
    func text(for direction: Directions, _ station: Station) {
        switch direction {
        case .departure:
            departureStation = station
            departureText = "\(departureCity) (\(departureStation.title))"
        case .destination:
            destinationStation = station
            destinationText = "\(destinationCity) (\(destinationStation.title))"
        }
    }
}
