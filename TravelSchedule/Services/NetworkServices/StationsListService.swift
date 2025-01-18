//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by big stepper on 18/01/2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession


typealias StationsList = Components.Schemas.StationsListResponse


protocol StationsServiceProtocol {
    func getStationsList() async throws -> StationsList
}

//получение всех станций
final class StationsService: StationsServiceProtocol {
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    
    func getStationsList() async throws -> StationsList {
        let response = try await client.getStations(query: .init(apikey: apikey))
        return try await JSONDecoder().decode(
            from: try response.ok.body.html,
            to: StationsList.self
        )
    }
}

