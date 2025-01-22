//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by big stepper on 22.01.2025.
//

import Foundation
import OpenAPIURLSession

typealias Segment = Components.Schemas.Segment

@MainActor
final class ScheduleViewModel: ObservableObject {
    
    private let networkManager = NetworkManager.shared
    
    @Published var paths: [Path] = []
    @Published var stateMachine = LoadingStateMachine()
    @Published var hasTransfers: Bool = true
    
    func getScheduleBetweenStations(from: String, to: String, hasTransfers: Bool?) async {
        paths.removeAll()
        stateMachine.state = .loading
        do {
            let response = try await networkManager.scheduleBetween(from: from, to: to, hasTransfers: hasTransfers ?? true)
            response.segments?
                .forEach { segment in
                    let carrier = getCarrierInfo(for: segment)
                    paths.append(Path(carrier: carrier,
                                      transfer: segment.stops,
                                      departure: segment.departure ?? "",
                                      arrival: segment.arrival ?? "",
                                      startDate: segment.start_date ?? "",
                                      hasTransfers: segment.has_transfers ?? false,
                                      shortTitle: segment.thread?.short_title ?? "",
                                      carrierLogo: segment.thread?.carrier?.logo ?? ""))
                }
            stateMachine.state = .loaded
        } catch {
            stateMachine.state = .error(.connectionLost)
        }
    }
    
    private func getCarrierInfo(for segment: Segment) -> CarrierInfo {
        CarrierInfo(logo: segment.thread?.carrier?.logo ?? "nigga",
                    title: segment.thread?.carrier?.title ?? "nigga",
                    email: segment.thread?.carrier?.email ?? "nigga",
                    phone: segment.thread?.carrier?.phone ?? "nigga")
    }
}
