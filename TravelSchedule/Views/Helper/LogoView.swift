//
//  LogoView.swift
//  TravelSchedule
//
//  Created by big stepper on 23.01.2025.
//

import SwiftUI

struct LogoView: View {
    
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
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
        .frame(height: 38, alignment: .leading)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    LogoView(url: "https://hws.dev/paul3.jpg")
}
