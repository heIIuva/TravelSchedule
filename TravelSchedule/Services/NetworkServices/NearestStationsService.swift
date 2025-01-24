//
//  NearestStationsService.swift
//  TravelSchedule
//
//  Created by big stepper on 18/01/2025.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias NearestStations = Components.Schemas.NearestStationsResponse


protocol NearestStationsServiceProtocol {
  func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}

//получение ближайших станций
final class NearestStationsService: NearestStationsServiceProtocol {
  private let client: Client
  private let apikey: String
  
  init(
    client: Client,
    apikey: String
  ) {
    self.client = client
    self.apikey = apikey
  }
  
  func getNearestStations(
    lat: Double,
    lng: Double,
    distance: Int
  ) async throws -> NearestStations {
    let response = try await client.getNearestStations(query: .init(
        apikey: apikey,
        lat: lat,
        lng: lng,
        distance: distance
    ))
    return try response.ok.body.json
  }
}
