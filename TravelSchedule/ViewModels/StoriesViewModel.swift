//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by big stepper on 30.01.2025.
//

import Foundation

@MainActor
final class StoriesViewModel: ObservableObject {
    
    init() {
        self.packs = [
            StoryPack(id: 0, preview: .storyPreview1, stories: [Story(id: 0, image: .story1), Story(id: 1, image: .story2)]),
            StoryPack(id: 1, preview: .storyPreview2, stories: [Story(id: 0, image: .story3), Story(id: 1, image: .story4)]),
            StoryPack(id: 2, preview: .storyPreview3, stories: [Story(id: 0, image: .story5), Story(id: 1, image: .story6)]),
            StoryPack(id: 3, preview: .storyPreview4, stories: [Story(id: 0, image: .story7), Story(id: 1, image: .story8)]),
            StoryPack(id: 4, preview: .storyPreview5, stories: [Story(id: 0, image: .story9), Story(id: 1, image: .story10)]),
            StoryPack(id: 5, preview: .storyPreview6, stories: [Story(id: 0, image: .story11), Story(id: 1, image: .story12)]),
            StoryPack(id: 6, preview: .storyPreview7, stories: [Story(id: 0, image: .story13), Story(id: 1, image: .story14)]),
            StoryPack(id: 7, preview: .storyPreview8, stories: [Story(id: 0, image: .story15), Story(id: 1, image: .story16)]),
            StoryPack(id: 8, preview: .storyPreview9, stories: [Story(id: 0, image: .story17), Story(id: 1, image: .story18)])
        ]
        
        
    }
    
    @Published private(set) var packs: [StoryPack] = []
    @Published private(set) var currentStories: [Story] = []
        
    func setSeen(_ pack: StoryPack) {
        guard let index = packs.firstIndex(where: {$0.id == pack.id} ) else { return }
        packs[index].seen = true
        currentStories = packs[index].stories
    }
}
