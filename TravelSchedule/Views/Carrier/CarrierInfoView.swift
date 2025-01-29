//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by big stepper on 24.01.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    
    @EnvironmentObject var router: Router
    
    let carrier: CarrierInfo
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: carrier.logo)) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                case .empty:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                default:
                    ProgressView()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .frame(maxHeight: 140)
            .padding()
        }
        
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(carrier.title)
                    .font(.bold24)
                
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading) {
                        Text("E-mail")
                        if carrier.email.isEmpty {
                            Text("Не предоставлен")
                                .font(.regular12)
                                .foregroundStyle(Color.ypRed)
                        } else {
                            Text(carrier.email)
                                .font(.regular12)
                                .foregroundStyle(Color.ypBlue)
                        }
                    }

                    VStack(alignment: .leading) {
                        Text("Телефон")
                        if carrier.phone.isEmpty {
                            Text("Не предоставлен")
                                .font(.regular12)
                                .foregroundStyle(Color.ypRed)
                        } else {
                            Text(carrier.phone)
                                .font(.regular12)
                                .foregroundStyle(Color.ypBlue)
                        }
                    }
                }
                .frame(height: 120)
            }
            Spacer()
        }
        .padding(.leading, 16)
        .navigationTitle("Информация о перевозчике")
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
        
        Spacer()
    }
}

#Preview {
    CarrierInfoView(carrier: CarrierInfo(
        logo: "https://yastat.net/s3/rasp/media/data/company/logo/logo.gif",
        title: "РЖД",
        email: "rzhd@mail.ru",
        phone: "+7(926)-401-81-98")
    )
}
