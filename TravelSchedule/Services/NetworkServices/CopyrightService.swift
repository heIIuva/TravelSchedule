//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by big stepper on 18/01/2025.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias Copyright = Components.Schemas.CopyrightResponse


protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> Copyright
}

//получение копирайтной информации
actor CopyrightService: CopyrightServiceProtocol {
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init(apikey: apikey))
        return try response.ok.body.json
    }
}
