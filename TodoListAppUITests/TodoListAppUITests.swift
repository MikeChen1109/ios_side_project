//
//  TodoListAppUITests.swift
//  TodoListAppUITests
//
//  Created by 逸唐陳 on 2023/8/2.
//

import XCTest

final class TodoListAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_request_button_is_visible() throws {
        let app = XCUIApplication()
        app.launch()
        
        let requestBtn = app.buttons["Request Post"]
        
        XCTAssertTrue(requestBtn.exists)
    }
    
    func test_request_button_is_tappable() throws {
        let app = XCUIApplication()
        app.launch()
        
        let requestBtn = app.buttons["Request Post"]
        
        XCTAssertTrue(requestBtn.isHittable)
    }
    
    func test_loading_activity_is_visible() throws {
        let app = XCUIApplication()
        app.launch()
        
        let requestBtn = app.buttons["Request Post"]
        requestBtn.tap()
        let loadingActivity = app.activityIndicators["loading"]
        
        XCTAssertTrue(loadingActivity.exists)
    }
    
    func test_alert_is_visible_when_error_occurs() {
        let app = XCUIApplication()
        app.launchEnvironment["showError"] = "true"
        app.launch()
        
        let requestBtn = app.buttons["Request Post"]
        requestBtn.tap()
        let alert = app.alerts["errorAlert"]
        
        XCTAssertTrue(alert.exists)
    }
    
    func test_navigation_to_detail_view() {
        let app = XCUIApplication()
        app.launch()
        
        let requestBtn = app.buttons["Request Post"]
        requestBtn.tap()
        let textView = app.textViews["postTextView"]
        
        XCTAssertTrue(textView.waitForExistence(timeout: 3))
    }
}
