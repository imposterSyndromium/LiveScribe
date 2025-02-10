//
//  LiveScribeUITests.swift
//  LiveScribeUITests
//
//  Created by Robin O'Brien on 2025-02-09.
//

import XCTest

@MainActor
final class LiveScribeUITests: XCTestCase {
    let app = XCUIApplication()
    

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testImputExists() {
        _ = app.textViews.firstMatch.waitForExistence(timeout: 1)
        XCTAssertEqual(app.textViews.count, 1, "There should be one text editor for the user to type into.")
    }
    
    func testOutputExists() {
        // because webViews are async, we need to wait for the webView to exist
        let webViewExists = app.webViews.firstMatch.waitForExistence(timeout: 1)
        XCTAssertTrue(webViewExists, "There should be one WKWebView for the user to see their rendered output.")
    }
    
    func testOutputMatchesInput() {
        _ = app.webViews.firstMatch.waitForExistence(timeout: 1)
        _ = app.textViews.firstMatch.waitForExistence(timeout: 1)
        let targetText = UUID().uuidString
        
        app.textViews.firstMatch.tap()
        app.typeText(targetText)
        XCTAssertTrue(app.webViews.firstMatch.staticTexts[targetText].exists, "Typing into the text editor should create matching output.")
        
    }
    
    func testSplitterExists() {
        XCTAssertEqual(app.splitters.count, 1, "There should be one splitter to separate the text editor and the web view.")
    }
    
    func testLinksWork() {
        _ = app.webViews.firstMatch.waitForExistence(timeout: 1)
        _ = app.textViews.firstMatch.waitForExistence(timeout: 1)
        app.textViews.firstMatch.tap()
        app.typeText("[Learn Swift](https://www.hackingwithswift.com)")
        XCTAssertEqual(app.links.count, 1, "Creating a link should make it tappable.")
    }
    
}
