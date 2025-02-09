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
}
