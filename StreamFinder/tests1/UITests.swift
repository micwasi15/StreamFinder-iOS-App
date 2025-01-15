import XCTest


final class LoginUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
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

        XCTAssertEqual(app.staticTexts["loginErrorLabel"].exists, LoginDataValidator.invalidPasswordErrorInfo)
    }
}