//
//  LiveScribeTests.swift
//  LiveScribeTests
//
//  Created by Robin O'Brien on 2025-02-09.
//



@testable import LiveScribe
import Foundation
import Testing

struct LiveScribeTests {
    
    @Test func empty() {
        let markdown = MarkdownParser(markdown: "")
        #expect(markdown.text == "")
    }
    
    @Test func singleParagraph() {
        let uuid = UUID().uuidString
        let markdown = MarkdownParser(markdown: uuid)
        let output = "<p>\(uuid)</p>"
        #expect(markdown.text == output)
    }
    
    @Test func multipleParagraphs() {
        let uuid = UUID().uuidString
        let input = Array(repeating: uuid, count: 3).joined(separator: "\n\n")
        let output = Array(repeating: "<p>\(uuid)</p>", count: 3).joined()
        let markdown = MarkdownParser(markdown: input)
        #expect(markdown.text == output)
    }
    
    @Test func strong() {
        let uuid = UUID().uuidString
        let input = "**\(uuid)**"
        let output = "<p><strong>\(uuid)</strong></p>"
        let markdown = MarkdownParser(markdown: input)
        #expect(markdown.text == output)
    }
    
    @Test func emphasis() {
        let uuid = UUID().uuidString
        let input = "*\(uuid)*"
        let output = "<p><em>\(uuid)</em></p>"
        let markdown = MarkdownParser(markdown: input)
        #expect(markdown.text == output)
    }
    
    @Test func strongEmphasis() {
        let uuid = UUID().uuidString
        let input = "***\(uuid)***"
        let output = "<p><em><strong>\(uuid)</strong></em></p>"
        let markdown = MarkdownParser(markdown: input)
        #expect(markdown.text == output)
    }
    
    @Test func link() {
        let uuid = UUID().uuidString
        let input = "[\(uuid)](https://www.hackingwithswift.com/\(uuid))"
        let output = "<p><a href=\"https://www.hackingwithswift.com/\(uuid)\">\(uuid)</a></p>"
        let markdown = MarkdownParser(markdown: input)
        #expect(markdown.text == output)
    }
    
    @Test(arguments: 1...6)
    func heading(number: Int) {
        let uuid = UUID().uuidString
        let headingString = String(repeating: "#", count: number)
        let input = "\(headingString) \(uuid)"
        let output = "<h\(number)>\(uuid)</h\(number)>"
        let markdown = MarkdownParser(markdown: input)
        #expect(markdown.text == output)
    }


}
