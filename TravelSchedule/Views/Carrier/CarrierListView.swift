//
//  CarrierListView.swift
//  TravelSchedule
//
//  Created by big stepper on 23.01.2025.
//

import SwiftUI

struct CarrierListView: View {
    
    @EnvironmentObject var viewModel: ScheduleViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var searchMachine: SearchMachine
    
    var body: some View {
        VStack {
            Text("\(searchMachine.departureText) → \(searchMachine.destinationText)")
                .font(.bold24)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
            switch viewModel.stateMachine.state {
            case .loading:
                Spacer()
                ProgressView()
                Spacer()
            case .error(let error):
                Spacer()
                ErrorView(type: error)
                Spacer()
            case .loaded:
                Spacer()
                if viewModel.filteredPaths.isEmpty {
                    Text("Вариантов нет")
                        .font(.bold24)
                    Spacer()
                } else {
                    List(viewModel.filteredPaths) { path in
                        CarrierListRowView(path: path)
                            .padding(.horizontal)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 0,
                                                 leading: 0,
                                                 bottom: 8,
                                                 trailing: 0))
                            .onTapGesture {
                                router.push(.goToCarrierInfoView(path.carrier))
                            }
                    }
                    .listStyle(.inset)
                }
            }
            Button(
                action: { router.push(.goToFiltersView) },
                label: {
                    if !viewModel.filteredPaths.isEmpty {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 343, height: 60)
                                .foregroundColor(Color.ypBlue)
                            HStack {
                                Text("Уточнить время")
                                    .font(.bold17)
                                    .foregroundColor(Color.white)
                                if viewModel.isFiltered {
                                    Circle()
                                        .tint(Color.ypRed)
                                        .frame(width: 8, height: 8)
                                }
                            }
                            .frame(alignment: .center)
                        }
                    }
                }
            )
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
    }
}

#Preview {
    CarrierListView()
}
