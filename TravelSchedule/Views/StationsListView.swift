//
//  StationsListVIew.swift
//  TravelSchedule
//
//  Created by big stepper on 22.01.2025.
//

import SwiftUI

struct StationsListView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var searchMachine: SearchMachine
    @EnvironmentObject var viewModel: CitiesViewModel
    
    @State private var searchText: String = ""
    
    let stations: [Station]
    let direction: Direction
    
    private var filteredStations: [Station] {
        searchText.isEmpty ? stations : stations.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchText)
            if filteredStations.isEmpty {
                VStack {
                    Spacer()
                    Text("Станция не найдена")
                        .font(.bold24)
                }
            }
            List(filteredStations) { station in
                ListRowView(text: station.title)
                    .padding(.horizontal, 16)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(.zero))
                    .onTapGesture {
                        searchMachine.setText(for: direction, station)
                        router.popToRoot()
                    }
            }
            .listStyle(.inset)
        }
        .navigationTitle("Выбор станции")
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
    }
}

#Preview {
    StationsListView(stations: [], direction: .departure)
}
