//
//  StoryPreview.swift
//  TravelSchedule
//
//  Created by big stepper on 30.01.2025.
//

import SwiftUI

struct StoryPreview: View {
    let pack: StoryPack
    
    var body: some View {
        ZStack{
            Image(pack.preview)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(pack.seen ? 0.5 : 1)
            VStack(alignment: .leading) {
                Spacer()
                Text(pack.title)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .padding(.init(top: .zero, leading: 8, bottom: 12, trailing: 8))
            }
        }
        .frame(width: 92, height: 140)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(pack.seen ? .clear : .blue , lineWidth: 4)
        )
    }
}
