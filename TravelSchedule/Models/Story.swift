//
//  Story.swift
//  TravelSchedule
//
//  Created by big stepper on 29.01.2025.
//

import Foundation

struct Story {
    let image: ImageResource
    let title: String
    let description: String
}

struct Stories: Identifiable {
    let id = UUID()
    let previewImage: ImageResource
    let previewDescription: String
    let stories: [Story]
    var isWatched: Bool = false
    
    
    
    static let mock: [Stories] = [
        Stories(
            previewImage: .storyPreview1,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story1,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story2,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
        Stories(
            previewImage: .storyPreview2,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story3,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story4,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
        Stories(
            previewImage: .storyPreview3,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story5,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story6,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
        Stories(
            previewImage: .storyPreview4,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story7,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story8,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
        Stories(
            previewImage: .storyPreview5,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story9,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story10,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
        Stories(
            previewImage: .storyPreview6,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story11,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story12,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
        Stories(
            previewImage: .storyPreview7,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story13,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story14,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
        Stories(
            previewImage: .storyPreview8,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story15,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story16,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
        Stories(
            previewImage: .storyPreview9,
            previewDescription: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", stories: [
                Story(
                    image: .story17,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
                Story(
                    image: .story18,
                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                    description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
            ]),
    ]
}
