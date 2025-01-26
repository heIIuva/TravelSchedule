//
//  CarrierListRow.swift
//  TravelSchedule
//
//  Created by big stepper on 23.01.2025.
//

import SwiftUI

struct CarrierListRowView: View {
    
    let path: Path
    
    var body: some View {
        HStack {
            VStack {
                HStack(spacing: 8) {
                    LogoView(url: path.carrier.logo)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(path.carrier.title)
                        if path.hasTransfers
                            && (path.transfer?.isEmpty != true),
                            let transferName = path.transfer {
                                Text("с пересадкой в \(transferName)")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(Color.ypRed)

                        }
                    }
                    Spacer()
                    VStack {
                        Text(path.startDate)
                            .font(.system(size: 12, weight: .regular))
                        Spacer()
                    }
                }
                HStack {
                    Text(path.departure)
                    VStack {
                        Divider()
                    }
                    Text(path.duration)
                        .font(.system(size: 12, weight: .regular))
                    VStack {
                        Divider()
                    }
                    Text(path.arrival)
                }
            }
        }
        .padding(.all, 14)
        .frame(height: 104)
        .background(Color.ypLightGray)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .foregroundColor(Color.black)
    }
}

#Preview {
    CarrierListRowView(path: Path(carrier: CarrierInfo(logo: "https://hws.dev/paul3.jpg", title: "ОАО РЖД", email: "rzhd@mail.ru", phone: "+7(999)-999-99-99"),
                                  transfer: "Город",
                                  departure: "9:00",
                                  arrival: "13:00",
                                  startDate: "25 января",
                                  hasTransfers: true,
                                  shortTitle: "РЖД",
                                  carrierLogo: "https://upload.wikimedia.org/wikipedia/commons/6/6f/Russian_Railways_Logo.svg",
                                  duration: "4 часa"))
}
