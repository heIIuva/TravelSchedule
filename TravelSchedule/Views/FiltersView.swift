//
//  FiltersView.swift
//  TravelSchedule
//
//  Created by big stepper on 24.01.2025.
//

import SwiftUI

struct FiltersView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel: ScheduleViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    Text("Время отправления")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.vertical, 16)
                    Group {
                        Toggle(DepartureTime.morning.rawValue,
                               isOn: $viewModel.morningFilter)
                        Toggle(DepartureTime.afternoon.rawValue,
                               isOn: $viewModel.afternoonFilter)
                        Toggle(DepartureTime.evening.rawValue,
                               isOn: $viewModel.eveningFilter)
                        Toggle(DepartureTime.night.rawValue,
                               isOn: $viewModel.nightFilter)
                    }
                    .frame(height: 60)
                    .font(.system(size: 17, weight: .regular))
                    .toggleStyle(CheckboxView(style: .checkbox))
                    Text("Показывать варианты с пересадками")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.vertical, 16)
                    Group {
                        Toggle(Transfer.yes.rawValue,
                               isOn: $viewModel.showTransfers)
                        .onChange(of: viewModel.doNotShowTransfers) { newValue in
                            if viewModel.showTransfers != false {
                                viewModel.showTransfers = !newValue
                            }
                        }
                        Toggle(Transfer.no.rawValue,
                               isOn: $viewModel.doNotShowTransfers)
                        .onChange(of: viewModel.showTransfers) { newValue in
                            if viewModel.doNotShowTransfers != false {
                                viewModel.doNotShowTransfers = !newValue
                            }
                        }
                    }
                    .frame(height: 60)
                    .font(.system(size: 17, weight: .regular))
                    .toggleStyle(CheckboxView(style: .circle))
                }
                .padding(.horizontal ,16)
                Spacer(minLength: 60)
            }
            .toolbarRole(.editor)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        router.pop()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 11, height: 19)
                            .font(Font.title.weight(.semibold))
                    }
                    .tint(.tabAccent)
                }
            }
            .scrollIndicators(.hidden)
            .padding(.bottom) 
            if viewModel.morningFilter ||
                viewModel.afternoonFilter ||
                viewModel.eveningFilter ||
                viewModel.nightFilter ||
                viewModel.showTransfers ||
                viewModel.doNotShowTransfers {
                VStack {
                    Spacer()
                    Button(
                        action: {
                            viewModel.applyFilters()
                            viewModel.isFiltered = true
                            router.pop()
                        },
                        label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .padding(.horizontal, 16)
                                    .frame(height: 60)
                                    .foregroundColor(.ypBlue)
                                Text("Применить")
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(Color.white)
                            }
                        })
                    .padding(.bottom, 24)
                }
            }
        }
    }
}
#Preview {
    FiltersView()
}
