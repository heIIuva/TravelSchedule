//
//  NetwirkManager.swift
//  TrainsSchedule
//
//  Created by big stepper on 11/12/2024.
//

import Foundation
import OpenAPIURLSession


protocol NetworkManagerProtocol: AnyObject {
    func nearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    
    func threadStations(uid: String) async throws -> ThreadStations
    
    func scheduleBetween(from: String, to: String, hasTransfers: Bool) async throws -> ScheduleBetween
    
    func stationSchedule(station: String) async throws -> ScheduleForStation
    
    func nearestSettlement(lat: Double, lng: Double) async throws -> NearestSettlement
    
    func carrier(code: String, system: System) async throws -> Carrier
    
    func stationsList() async throws -> StationsList
    
    func copyright() async throws -> Copyright
}


actor NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private init() {
        let url = try? Servers.Server1.url()
        self.client = Client(serverURL: url ?? URL(filePath: ""), transport: URLSessionTransport())
    }
        
    private let client: Client
    
    func nearestStations(
        lat: Double,
        lng: Double,
        distance: Int
    ) async throws -> NearestStations {
        
        let service = NearestStationsService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        return try await service.getNearestStations(lat: lat, lng: lng, distance: distance)
    }
    
    func threadStations(
        uid: String
    ) async throws -> ThreadStations {
        
        let service = ThreadStationsService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        return try await service.getThreadStations(uid: uid)
    }
    
    func scheduleBetween(
        from: String,
        to: String,
        hasTransfers: Bool
    ) async throws -> ScheduleBetween {
        
        let service = ScheduleBetweenService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        return try await service.getScheduleBetweenStations(from: from, to: to, hasTransfers: hasTransfers)
    }
    
    func stationSchedule(
        station: String
    ) async throws -> ScheduleForStation {
        
        let service = ScheduleForStationService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        return try await service.getScheduleForStation(station: station)
    }
    
    func nearestSettlement(
        lat: Double,
        lng: Double
    ) async throws -> NearestSettlement {
        
        let service = NearestSettlementService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        return try await service.getNearestSettlement(lat: lat, lng: lng)
    }
    
    func carrier(
        code: String,
        system: System
    ) async throws -> Carrier {
        
        let service = CarrierService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        return try await service.getCarrier(code: code, system: system)
    }
    
    func stationsList() async throws -> StationsList {
        let service = StationsService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
       return try await service.getStationsList()
    }
    
    func copyright() async throws -> Copyright {
        let service = CopyrightService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        return try await service.getCopyright()
    }
}
