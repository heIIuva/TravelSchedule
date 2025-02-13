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
    
    private let networkManager = NetworkManager.shared
    
    @Published var searchText: String = ""
    @Published private(set) var cities: [City] = []
    @Published private(set) var stateMachine = LoadingStateMachine()
    
    func getFilteredCities() -> [City] {
        searchText.isEmpty ? cities : cities.filter { $0.title.lowercased().contains(searchText.lowercased())}
    }
    
    func getCities() async {
        cities.removeAll()
        stateMachine.state = .loading
        do {
            let stations = try await networkManager.stationsList()
            stations.countries?
                .filter { $0.title == "Россия" }
                .forEach { country in country.regions?.forEach { region in getSettlements(in: region) }}
            cities.sort { $0.title < $1.title }
            stateMachine.state = .loaded
        } catch {
            stateMachine.state = .error(.connectionLost)
        }
    }
    
    private func getSettlements(in region: Components.Schemas.RegionsData) {
        region.settlements?.forEach { settlement in
            guard let settlementTitle = settlement.title,
                  !settlementTitle.isEmpty
            else { return }
            var stations: [Station] = []
            getStations(in: settlement, stations: &stations)
            guard !stations.isEmpty else { return }
            stations.sort(by: { $1.title > $0.title })
            let city = City(title: settlementTitle, stations: stations)
            cities.append(city)
        }
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
