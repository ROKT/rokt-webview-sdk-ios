//
//  RoktWebViewSDK_ExampleUITests.swift
//  RoktWebViewSDK_ExampleUITests
//
//  Copyright 2020 Rokt Pte Ltd
//  Licensed under the Rokt Software Development Kit (SDK) Terms of Use
//  Version 2.0 (the "License");
//  You may not use this file except in compliance with the License.
//  You may obtain a copy of the License at https://rokt.com/sdk-license-2-0/
//

import XCTest

class RoktWebViewSDK_ExampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWKWebViewOpenExternalBrowser() throws {
        // UI tests must launch the application.
        let app = XCUIApplication()
        // Safari application
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        //Launch Example application
        app.launch()
        
        //Bring Mock website with rokt button
        app/*@START_MENU_TOKEN@*/.staticTexts["Mock"]/*[[".buttons[\"Mock\"].staticTexts[\"Mock\"]",".staticTexts[\"Mock\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //tap on external browser button on webview
        let openLinkInExternalBrowserButton = app.webViews.webViews.webViews.buttons["Open Link in External Browser"]
        openLinkInExternalBrowserButton.tap()
        
        //wait for safari to be opened and running on forground
        XCTAssert(safari.wait(for: .runningForeground, timeout: 30))
    }

}

