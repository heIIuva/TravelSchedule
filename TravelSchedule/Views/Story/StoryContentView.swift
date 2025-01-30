//
//  StoryContentView.swift
//  TravelSchedule
//
//  Created by big stepper on 30.01.2025.
//

import SwiftUI

@MainActor
struct StoryContentView: View {
    let stories: [Story]
    @Binding var isPresented: Bool
    @State var currentStoryIndex: Int = 0

    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesView(stories: stories, isPresented: $isPresented)
            CloseButton(action: { isPresented = false })
                .padding(.top, 57)
                .padding(.trailing, 12)
        }
    }
}

