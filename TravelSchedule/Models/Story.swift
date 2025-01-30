//
//  Story.swift
//  TravelSchedule
//
//  Created by big stepper on 30.01.2025.
//

import SwiftUI

struct Story: Identifiable, Hashable {
    let id: Int
    let image: ImageResource
    let title: String = Array(repeating: "Text", count: 9).joined(separator: " ")
    let description: String = Array(repeating: "Text", count: 20).joined(separator: " ")
}

struct StoryPack: Identifiable, Hashable {
    let id: Int
    let preview: ImageResource
    let stories: [Story]
    let title: String = Array(repeating: "Text", count: 7).joined(separator: " ")
    var seen: Bool = false
}
