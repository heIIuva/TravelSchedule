//
//  UserAgreementWebView.swift
//  TravelSchedule
//
//  Created by big stepper on 19.01.2025.
//

import SwiftUI
import WebKit

struct UserAgreementWebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: url) else { return }
        uiView.load(URLRequest(url: url))
    }
}

#Preview {
    UserAgreementWebView(url: Constants.practicumURL)
}
