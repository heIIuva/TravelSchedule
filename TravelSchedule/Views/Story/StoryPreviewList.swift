//
//  StoryPreviewList.swift
//  TravelSchedule
//
//  Created by big stepper on 30.01.2025.
//

import SwiftUI

@MainActor
struct StoryPreviewList: View {
    
    init(isPresented: Bool) {
        self.isPresented = isPresented
    }
    
    @State private var isPresented: Bool
    @EnvironmentObject var viewModel: StoriesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(viewModel.packs) { pack in
                    StoryPreview(pack: pack)
                        .onTapGesture {
                            withAnimation {
                                viewModel.setSeen(pack)
                                isPresented.toggle()
                            }
                        }
                        .fullScreenCover(isPresented: $isPresented) {
                            StoryContentView(stories: pack.stories, isPresented: $isPresented)
                        }
                }
            }
            .padding(.init(top: 24, leading: 16, bottom: 24, trailing: 16))
        }
        .padding(.vertical, 24)
    }
}
