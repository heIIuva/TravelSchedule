//
//  CitiesViewModel.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import Foundation
import OpenAPIURLSession

@MainActor
final class CitiesViewModel: ObservableObject {
    
    @Published var cities: [City] = []
    
    private func getSettlements(in region: Components.Schemas.RegionsData) {
        
    }
    
    private func getStations(in settlement: Components.Schemas.RegionsSettlements, stations: inout [Station]) {
        settlement.stations?.forEach { station in
            guard station.transport_type == "train",
                  let stationTitle = station.title,
                  let code = station.codes?.yandex_code,
                  !stationTitle.isEmpty
            else { return }
            stations.append(Station(title: stationTitle, code: code))
        }
    }
}
