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
            CitiesListView(direction: direction)
        case let .goToStationsListView(stations, direction):
            StationsListView(stations: stations, direction: direction)
        case .goToCarrierListView:
            CarrierListView()
        case .goToFiltersView:
            EmptyView()
        case .goToCarrierInfoView:
            EmptyView()
        }
    }
    
    @inlinable
    @inline(__always)
    func push(_ appRoute: Route) {
        DispatchQueue.main.async {
            self.path.append(appRoute)
        }
    }
    
    @inlinable
    @inline(__always)
    func pop() {
        DispatchQueue.main.async {
            guard !self.path.isEmpty else { return }
            self.path.removeLast()
        }
    }
    
    @inlinable
    @inline(__always)
    func popToRoot() {
        DispatchQueue.main.async {
            self.path.removeLast(self.path.count)
        }
    }
}
