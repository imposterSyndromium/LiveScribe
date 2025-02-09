//
//  SimpleWebView.swift
//  LiveScribe
//
//  Created by Robin O'Brien on 2025-02-09.
//

import SwiftUI
import WebKit

struct SimpleWebView: NSViewRepresentable {
    var content: String
    
    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateNSView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(content, baseURL: nil)
    }
    
}



#Preview {
    SimpleWebView(content: "Hello, World!")
}
