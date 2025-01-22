//
//  CarrierListRow.swift
//  TravelSchedule
//
//  Created by big stepper on 23.01.2025.
//

import SwiftUI

struct CarrierListRow: View {
    
    var path: Path
    
    var body: some View {
        HStack {
            
        }
        .frame(width: 343, height: 104)
        .background(Color.lightGray)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    CarrierListRow(path: Path(carrier: CarrierInfo(logo: "https://upload.wikimedia.org/wikipedia/commons/6/6f/Russian_Railways_Logo.svg", title: "ОАО РЖД", email: "rzhd@mail.ru", phone: "+7(999)-999-99-99"), transfer: "с пересадкой в нигере", departure: "9.00", arrival: "13.00", startDate: "25 Января", hasTransfers: true, shortTitle: "РЖД", carrierLogo: "https://upload.wikimedia.org/wikipedia/commons/6/6f/Russian_Railways_Logo.svg"))
}
