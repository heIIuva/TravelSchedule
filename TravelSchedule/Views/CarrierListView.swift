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
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
            VStack {
            }
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
                if viewModel.paths.isEmpty {
                    Text("Вариантов нет")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                } else {
                    List(viewModel.paths) { path in
                        CarrierListRowView(path: path)
                            .padding(.horizontal)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 0,
                                                 leading: 0,
                                                 bottom: 8,
                                                 trailing: 0))
                    }
                    .listStyle(.inset)
                }
            }
            Button(
                action: { router.push(.goToFiltersView) },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 343, height: 60)
                            .foregroundColor(Color.blue)
                        HStack {
                            Text("Найти")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color.white)
                        }
                        .frame(alignment: .center)
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
                    Label("", image: "chevronLeft")
                }
                .tint(.tabAccent)
            }
        }
    }
}

#Preview {
    CarrierListView()
}
