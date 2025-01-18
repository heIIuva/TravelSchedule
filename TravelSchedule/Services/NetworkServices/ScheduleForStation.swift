//
//  ScheduleForStation.swift
//  TravelSchedule
//
//  Created by big stepper on 18/01/2025.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias ScheduleForStation = Components.Schemas.StationScheduleResponse


protocol ScheduleForStationServiceProtocol {
    func getScheduleForStation(station: String) async throws -> ScheduleForStation
}

//получение расписания для станции
final class ScheduleForStationService: ScheduleForStationServiceProtocol {
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
  
    func getScheduleForStation(
        station: String
    ) async throws -> ScheduleForStation {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apikey,
            station: station
            )
        )
        return try response.ok.body.json
    }
}


