//
//  StreamFinderUITests.swift
//  StreamFinderUITests
//
//  Created by stud on 16/01/2025.
//

import XCTest
@testable import StreamFinder


final class LoginUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        app.launchArguments.append("-loginMode")
        app.launch()
    }

    override func tearDown() {
        app.terminate()
    }

    func testLogin() {
        let emailTextField = app.textFields["emailTextField"]
        let passwordTextField = app.secureTextFields["passwordTextField"]
        let loginButton = app.buttons["loginButton"]

        emailTextField.tap()
        emailTextField.typeText("john@gmail.com")

        passwordTextField.tap()
        passwordTextField.typeText("1234")

        loginButton.tap()
        
        let loginErrorLabel = app.staticTexts["loginErrorLabel"]
        XCTAssertTrue(loginErrorLabel.waitForExistence(timeout: 5))
    }
}


final class SearchUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app.terminate()
    }

    func testSearch() {
        let searchField = app.textFields["searchField"]
        
        searchField.tap()
        searchField.typeText("Friends")
        searchField.typeText("\n")
        
        let loadingScreen = app.images["loadingScreen"]
        
        XCTAssertTrue(loadingScreen.waitForExistence(timeout: 5))
    }
}


final class StreamFinderUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
