//
//  RouteModel.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import Foundation


enum Route: Hashable {
    case goToCityListView(Direction)
    case goToStationsListView([Station], Direction)
    case goToCarrierListView
    case goToFiltersView
    case goToCarrierInfoView(CarrierInfo)
    case goToUserAgreementView
}
