//
//  ContentView.swift
//  LiveScribe
//
//  Created by Robin O'Brien on 2025-02-09.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    
    var body: some View {
        HSplitView {
            TextEditor(text: $input)
                .padding()
            SimpleWebView(content: MarkdownParser(markdown: input).text)
        }
    }
}

#Preview {
    ContentView()
}
