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
    @ObservedObject var viewModel: CitiesViewModel
        
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack {
                    TextField(text: $searchMachine.departureText, label: {
                        Text("Откуда")
                            .foregroundColor(Color.lightGray)
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
                            .foregroundColor(Color.lightGray)
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
                .padding(.all, 16)
                Button(action: searchMachine.swapDirections) {
                    Image("swapDirections")
                        .tint(Color.blue)
                        .frame(width: 36, height: 36)
                        .background(Circle().fill(Color.white))
                        .padding(.trailing, 16)
                }
            }
            .background(Color.blue.cornerRadius(20))
            .padding(.horizontal, 16)
            .padding(.top, 208)
            if !searchMachine.departureText.isEmpty && !searchMachine.destinationText.isEmpty {
                Button(
                    action: { router.push(.goToCarrierListView) },
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 150, height: 60)
                                .foregroundColor(Color.blue)
                            Text("Найти")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color.white)
                        }
                    })
            }
            Spacer()
            Divider()
                .padding(.bottom, 16)
        }
    }
}

#Preview {
    ScheduleView(viewModel: CitiesViewModel())
}
