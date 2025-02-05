//
//  NearestSettlementService.swift
//  TravelSchedule
//
//  Created by big stepper on 18/01/2025.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias NearestSettlement = Components.Schemas.NearestSettlementResponse


protocol NearestSettlementServiceProtocol {
    func getNearestSettlement(lat: Double, lng: Double) async throws -> NearestSettlement
}

//получение ближайшего населенного пункта
actor NearestSettlementService: NearestSettlementServiceProtocol {
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    
    func getNearestSettlement(
        lat: Double,
        lng: Double
    ) async throws -> NearestSettlement {
        let response = try await client.getNearestSettlement(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng
            )
        )
        return try response.ok.body.json
    }
}
