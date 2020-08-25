//
//  RoktWebViewSDK_ExampleUITests.swift
//  RoktWebViewSDK_ExampleUITests
//
//  Created by Danial Motahari on 24/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
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
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        app.launch()
        //Bring Mock website
        app/*@START_MENU_TOKEN@*/.staticTexts["Mock"]/*[[".buttons[\"Mock\"].staticTexts[\"Mock\"]",".staticTexts[\"Mock\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        //tap on external browser button on webview
        let openLinkInExternalBrowserButton = app.webViews.webViews.webViews.buttons["Open Link in External Browser"]
        openLinkInExternalBrowserButton.tap()
        //wait for safari to be opened
        let _ = safari.wait(for: .runningForeground, timeout: 10)
        
        //assert safari is in active
        XCTAssert(safari.isHittable)
    }

}

