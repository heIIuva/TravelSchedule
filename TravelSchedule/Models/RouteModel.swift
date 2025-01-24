//
//  RouteModel.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import Foundation


enum Route: Hashable {
    case goToCityListView(Directions)
    case goToStationsListView([Station], Directions)
    case goToCarrierListView
    case goToFiltersView
    case goToCarrierInfoView(CarrierInfo)
    case goToUserAgreementView
}
