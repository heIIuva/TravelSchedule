//
//  StoryView.swift
//  TravelSchedule
//
//  Created by big stepper on 30.01.2025.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.ypBlack
                .ignoresSafeArea()
            Image(story.image)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.top, 7)
                .padding(.bottom, 17)
                .padding(.horizontal, .zero)
                .overlay {
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 10) {
                            Text(story.title)
                                .font(.bold34)
                                .foregroundColor(.white)
                            Text(story.description)
                                .font(.regular20)
                                .lineLimit(3)
                                .foregroundColor(.white)
                        }
                        .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
                    }
                }
        }
    }
}
