//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by big stepper on 18/01/2025.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias Carrier = Components.Schemas.CarrierResponse
typealias System = Operations.getCarrier.Input.Query.systemPayload


protocol CarrierServiceProtocol {
    func getCarrier(code: String, system: System) async throws -> Carrier
}

//получение информации о перевозчике
final class CarrierService: CarrierServiceProtocol {
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarrier(code: String, system: System) async throws -> Carrier {
        let response = try await client.getCarrier(query: .init(
            apikey: apikey,
            code: code,
            system: system
            )
        )
        return try response.ok.body.json
    }
}
