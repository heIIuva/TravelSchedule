//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI

@MainActor
struct ScheduleView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var searchMachine: SearchMachine
    @EnvironmentObject var citiesViewModel: CitiesViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
        
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack {
                    TextField(text: $searchMachine.departureText, label: {
                        Text("Откуда")
                            .foregroundColor(Color.ypGray)
                    })
                    .foregroundColor(Color.black)
                    .font(.system(size: 17))
                    .frame(height: 48)
                    .padding(.leading, 16)
                    .simultaneousGesture(TapGesture().onEnded {
                        router.push(.goToCityListView(.departure))
                    })
                    TextField(text: $searchMachine.destinationText, label: {
                        Text("Куда")
                            .foregroundColor(Color.ypGray)
                    })
                    .foregroundColor(Color.black)
                    .font(.system(size: 17))
                    .frame(height: 48)
                    .padding(.leading, 16)
                    .simultaneousGesture(TapGesture().onEnded {
                        router.push(.goToCityListView(.destination))
                    })
                }
                .background(Color.white.cornerRadius(20))
                .padding()
                Button(action: {
                    searchMachine.swapDirections()
                    Task {
                        await scheduleViewModel.getScheduleBetweenStations(from: searchMachine.departureStation.code, to: searchMachine.destinationStation.code, hasTransfers: true)
                    }
                }
                ) {
                    Image("swapDirections")
                        .tint(Color.ypBlue)
                        .frame(width: 36, height: 36)
                        .background(Circle().fill(Color.white))
                        
                }
                .padding(.trailing, 16)
            }
            .background(Color.ypBlue.cornerRadius(20))
            .padding(.horizontal, 16)
            .padding(.top, 208)
            if !searchMachine.departureText.isEmpty && !searchMachine.destinationText.isEmpty {
                Button(
                    action: { 
                        router.push(.goToCarrierListView)
                        Task {
                            if scheduleViewModel.filteredPaths.isEmpty {
                                await scheduleViewModel.getScheduleBetweenStations(from: searchMachine.departureStation.code, to: searchMachine.destinationStation.code, hasTransfers: true)
                            }
                        }
                    },
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 150, height: 60)
                                .foregroundColor(Color.ypBlue)
                            Text("Найти")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color.white)
                        }
                    })
            }
            Spacer()
            Divider()
                .padding(.bottom, 10)
        }
    }
}

#Preview {
    ScheduleView()
}
