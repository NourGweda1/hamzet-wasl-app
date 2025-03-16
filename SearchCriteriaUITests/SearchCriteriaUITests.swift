//
//  SearchCriteriaUITests.swift
//  SearchCriteriaUITests
//
//  Created by Nour Gweda on 13/03/2025.
//

import XCTest

@MainActor
final class SearchCriteriaUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app.launch()

        let aiEngineButton = app.buttons["aiEngineButton"]

        // first step login
        setUpLoginData()

        // check if home appeared
        let goodMorningText = app.staticTexts["Good Morning 👋🏾"]
        XCTAssertTrue(goodMorningText.waitForExistence(timeout: 10), "HomeAppearedSuccessfully")

        // check if AI section in home appeared
        let aiEngineText = app.staticTexts["Hurry Up! 🗣️"]
        XCTAssertTrue(aiEngineText.waitForExistence(timeout: 10), "HomeAISectionAppearedSuccessfully")

        // tap to navigate to AI Engine Widget
        aiEngineButton.tap()

        // check if AI Engine Appeared
        let searchEventsText = app.staticTexts["Search For Events"]
        XCTAssertTrue(searchEventsText.waitForExistence(timeout: 10), "AIEngineViewAppearedSuccessfully")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func setUpLoginData() {
        let emailField = app.textFields["emailTextField"]
        let passwordField = app.secureTextFields["passwordTextField"]
        let loginButton = app.buttons["signInButton"]

        emailField.tap()
        emailField.typeText("nour.gweda@trianglz.com")
        passwordField.tap()
        passwordField.typeText("Nour1997!")
        loginButton.tap()
    }

    func test_searchCriteriaElemets_shouldExists() {
        XCTAssertTrue(app.staticTexts["interestsTextField"].exists)
        XCTAssertTrue(app.staticTexts["locationTextField"].exists)
        XCTAssertTrue(app.staticTexts["dateTextField"].exists)
    }

    func test_interestsSelectionView_shouldOpen() {
        let interestsTextField = app.textFields["interestsTextField"]
        interestsTextField.tap()

        let interestsSelectionView = app.otherElements["InterestsSelectionView"]
        XCTAssertTrue(interestsSelectionView.waitForExistence(timeout: 2), "Interests selection view should open")
        XCTAssertTrue(app.otherElements["InterestsSelectionView"].exists)
    }

    func test_countriesSelectionView_shouldOpen() {
        let countriesTextField = app.textFields["locationTextField"]
        countriesTextField.tap()

        let countriesSelectionView = app.otherElements["CountriesWidget"]
        XCTAssertTrue(countriesSelectionView.waitForExistence(timeout: 2), "Countries selection view should open")
        XCTAssertTrue(app.otherElements["CountriesWidget"].exists)
    }

    func test_dateSelectionView_shoudlOpen() {
        let dateTextField = app.textFields["dateTextField"]
        dateTextField.tap()

        let dateSelectionView = app.otherElements["CalendarWidget"]
        XCTAssertTrue(dateSelectionView.waitForExistence(timeout: 2), "Calendar selection view should open")
        XCTAssertTrue(app.otherElements["CalendarWidget"].exists)
    }

    func test_dateSelectionView_shoudlClose() {
        let dateTextField = app.textFields["dateTextField"]
        let closeButton = app.buttons["CloseButton"]
        let dateSelectionView = app.otherElements["CalendarWidget"]

        dateTextField.tap()

        XCTAssertTrue(dateSelectionView.waitForExistence(timeout: 2), "Calendar selection view should open")
        XCTAssertTrue(app.otherElements["CalendarWidget"].exists)

        let dateTitleText = app.staticTexts["Select Date"]
        XCTAssertTrue(dateTitleText.waitForExistence(timeout: 10), "CalendarDateAppearedSuccessfully")

        let aya = app.otherElements["Aya"]
        XCTAssertTrue(aya.waitForExistence(timeout: 2), "aya view should open")

        closeButton.tap()
        
        XCTAssertTrue(dateSelectionView.waitForExistence(timeout: 2), "Calendar selection view should open")
        XCTAssertFalse(dateSelectionView.exists)
    }

    // start testing the Engine view
    func testSubmitButtonDisabledWithoutData() {
        let submitButton = app.buttons["SubmitButton"]
        XCTAssertTrue(submitButton.exists, "SubmitButton should exist")
        
        submitButton.tap()

        let recommendationsView = app.otherElements["RecommendationsView"]
        XCTAssertFalse(recommendationsView.waitForExistence(timeout: 2), "RecommendationsView should appear after tapping Submit while having date")
        XCTAssertFalse(recommendationsView.exists, "RecommendationsView should appear after tapping Submit while having date")
    }

    func testSubmitButtonEnabledWitData() {
        let submitButton = app.buttons["SubmitButton"]
        XCTAssertTrue(submitButton.exists, "SubmitButton should exist")

        let textEditor = app.textViews.firstMatch
        textEditor.tap()
        textEditor.typeText("Test note, test note, test note 123")
        submitButton.tap()

        //let recommendationsWidget = app.otherElements["RecommendationsWidget"]
        //XCTAssertTrue(recommendationsWidget.waitForExistence(timeout: 10), "RecommendationsWidget should open")
        //XCTAssertTrue(app.otherElements["RecommendationsWidget"].exists)

        // 2nd trial
        let recommendationsText = app.staticTexts["Recommendedations For You"]
        XCTAssertTrue(recommendationsText.waitForExistence(timeout: 10), "recommendationsViewAppearedSuccessfully")
    }

    func testPlaceholderTextIsDisplayedWhenNoteIsEmpty() {
        let placeholderText = app.staticTexts["Describe your event(e.g., 'A cozy jazz night in Cairo')"]
        XCTAssertTrue(placeholderText.exists, "Placeholder text should be displayed when the note is empty.")
    }

    func testPlaceholderTextDisappearsWhenUserStartsTyping() {
        let textEditor = app.textViews.firstMatch
        textEditor.tap()
        
        textEditor.typeText("Test note, test note, test note 123")
        
        let placeholderText = app.staticTexts["Describe your event(e.g., 'A cozy jazz night in Cairo')"]
        XCTAssertFalse(placeholderText.exists, "Placeholder text should disappear when the user starts typing.")
    }
}
