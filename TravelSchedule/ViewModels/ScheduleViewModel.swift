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
    private let formatter = DateFormatter.dateFormatter
    
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
                                      departure: convertTime(from: segment.departure ?? ""),
                                      arrival: convertTime(from: segment.arrival ?? ""),
                                      startDate: convertDate(for: segment),
                                      hasTransfers: segment.has_transfers ?? false,
                                      shortTitle: segment.thread?.short_title ?? "",
                                      carrierLogo: segment.thread?.carrier?.logo ?? "",
                                      duration: convertDuration(duration: segment.duration ?? 3600)))
                    print("DEPARTURE \(segment.departure)")
                    print("arrival \(segment.arrival)")
                }
            sortPaths()
            stateMachine.state = .loaded
        } catch {
            stateMachine.state = .error(.connectionLost)
        }
    }
    
    private func getCarrierInfo(for segment: Segment) -> CarrierInfo {
        CarrierInfo(logo: segment.thread?.carrier?.logo ?? "",
                    title: segment.thread?.carrier?.title ?? "",
                    email: segment.thread?.carrier?.email ?? "",
                    phone: segment.thread?.carrier?.phone ?? "")
    }
    
    private func convertDuration(duration: Int) -> String {
        let convertedDuration = duration / 3600
        return .localizedStringWithFormat(NSLocalizedString("numberOfHours", comment: ""), convertedDuration)
    }
    
    private func convertDate(for segment: Segment) -> String {
        guard let stringDate = segment.start_date else { return "" }
        formatter.dateFormat = "y-M-d"
        let date = formatter.date(from: stringDate)
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: date ?? Date())
    }
    
    private func convertTime(from string: String) -> String {
        formatter.dateFormat = "HH:mm:ss"
        guard let formattedTime = formatter.date(from: string) else { return "huihui"}
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: formattedTime)
    }
    
    private func sortPaths() {
        formatter.dateFormat = "d MMMM"
        paths.sort(by: { formatter.date(from: $0.startDate) ?? Date() < formatter.date(from: $1.startDate) ?? Date() })
    }
}
