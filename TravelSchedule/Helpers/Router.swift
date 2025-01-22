//
//  Router.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import SwiftUI

@MainActor
final class Router: ObservableObject {
    
    @Published var path = NavigationPath()
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case let .goToCityListView(direction):
            CitiesListView(viewModel: CitiesViewModel(), direction: direction)
        case let .goToStationsListView(stations, direction):
            StationsListView(stations: stations, direction: direction)
        case .goToCarrierListView:
            CarrierListView(viewModel: ScheduleViewModel())
        case .goToFiltersView:
            EmptyView()
        case .goToCarrierInfoView:
            EmptyView()
        }
    }
    
    @inlinable
    @inline(__always)
    func push(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    @inlinable
    @inline(__always)
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    @inlinable
    @inline(__always)
    func popToRoot() {
        path.removeLast(path.count)
    }
}
