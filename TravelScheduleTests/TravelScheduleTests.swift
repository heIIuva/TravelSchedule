//
//  TravelScheduleTests.swift
//  TravelScheduleTests
//
//  Created by big stepper on 18.01.2025.
//

import XCTest
import OpenAPIURLSession
@testable import TravelSchedule

final class TrainsScheduleTests: XCTestCase {

    let networkManager = NetworkManager.shared
    
    // ручка /v3.0/search/
    func testSchedulesBetweenStations() async {
       let expectation = expectation(description: "testSchedulesBetween")
       do {
           let result = try await networkManager.scheduleBetween(from: "c146", to: "c213")
           XCTAssertNotNil(result)
           expectation.fulfill()
       } catch {
           XCTFail(error.localizedDescription)
       }
       await fulfillment(of: [expectation], timeout: 10)
   }
    // ручка /v3.0/schedule/
    func testStationSchedule() async {
        let expectation = expectation(description: "testStationSchedule")
        do {
            let result = try await networkManager.stationSchedule(station: "s9613830")
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }

        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/thread/
    func testThreadStations() async {
        let expectation = expectation(description: "testThreadStations")
        do {
            let result = try await networkManager.threadStations(uid: "6296x6294x6292x6291_0_9613602_g24_4")
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/nearest_stations/
    func testNearestStation() async {
        let expectation = expectation(description: "testNearestStations")
        do {
            let result = try await networkManager.nearestStations(lat: 55.665390, lng: 37.777104, distance: 50)
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }

        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/nearest_settlement/
    func testNearestSettlement() async {
        let expectation = expectation(description: "testNearestSettlement")
        do {
        let result = try await networkManager.nearestSettlement(lat: 55.665390,
                                                                lng: 37.777104)
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }

        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/carrier/
    func testCarrier() async {
        let expectation = expectation(description: "testCarrier")
        do {
            let result = try await networkManager.carrier(code: "TK", system: .iata)
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }

        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/stations_list/
    func testStationsList() async {
        let expectation = expectation(description: "testStationsList")
        do {
            let result = try await networkManager.stationsList()
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }

        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/copyright/
    func testCopyright() async {
        let expectation = expectation(description: "testCopyright")
        do {
            let result = try await networkManager.copyright()
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }

        await fulfillment(of: [expectation], timeout: 10)
    }
}
