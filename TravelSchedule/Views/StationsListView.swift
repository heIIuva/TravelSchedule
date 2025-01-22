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
    
    @State private var searchText: String = ""
    
    let stations: [Station]
    let direction: Directions
    
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
                        .font(.system(size: 24, weight: .bold))
                }
            }
            List(filteredStations) { station in
                ListRowView(text: station.title)
                    .padding(.horizontal, 16)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(.zero))
                    .onTapGesture {
                        searchMachine.text(for: direction, station)
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
                    Label("", image: "chevronLeft")
                }
                .tint(.tabAccent)
            }
        }
    }
}

#Preview {
    StationsListView(stations: [], direction: .departure)
}
