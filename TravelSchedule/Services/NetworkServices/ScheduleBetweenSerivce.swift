//
//  ScheduleBetweenService.swift
//  TravelSchedule
//
//  Created by big stepper on 18/01/2025.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias ScheduleBetween = Components.Schemas.SchedulesBetweenStationsResponse


protocol ScheduleBetweenServiceProtocol {
    func getScheduleBetweenStations(from: String, to: String, hasTransfers: Bool?) async throws -> ScheduleBetween
}

//получение расписания между станциями
actor ScheduleBetweenService: ScheduleBetweenServiceProtocol {
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
  
    func getScheduleBetweenStations(
        from: String,
        to: String,
        hasTransfers: Bool?
    ) async throws -> ScheduleBetween {
        let response = try await client.getSchedulesBetweenStations(query: .init(
            apikey: apikey,
            from: from,
            to: to,
            transfers: hasTransfers
            )
        )
        return try response.ok.body.json
    }
}
