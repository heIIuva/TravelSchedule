//
//  CitiesListView.swift
//  TravelSchedule
//
//  Created by big stepper on 22.01.2025.
//

import SwiftUI

struct CitiesListView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var searchMachine: SearchMachine
    @EnvironmentObject var viewModel: CitiesViewModel
    
    
    let direction: Direction
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText)
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
                if viewModel.getFilteredCities().isEmpty {
                    Text("Город не найден")
                        .font(.bold24)
                Spacer()
                } else {
                    List(viewModel.getFilteredCities()) { city in
                        ListRowView(text: city.title)
                            .padding(.horizontal, 16)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(.zero))
                            .onTapGesture {
                                searchMachine.setCity(for: direction, city.title)
                                router.push(.goToStationsListView(city.stations, self.direction))
                            }
                    }
                    .listStyle(.inset)
                }
            }
        }
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
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
        .onAppear {
            viewModel.searchText = ""
        }
        .task {
            if viewModel.cities.isEmpty {
                await viewModel.getCities()
            }
        }
    }
}

#Preview {
    CitiesListView(direction: .departure)
}

