//
//  RouterView.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import SwiftUI

struct RouterView<Content: View>: View {
    @inlinable
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    @StateObject private var router = Router()
    private let content: Content

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Route.self) {
                    router.view(for: $0)
                        .navigationBarBackButtonHidden()
                }
        }
        .environmentObject(router)
    }
}

