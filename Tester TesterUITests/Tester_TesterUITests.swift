//
//  Tester_TesterUITests.swift
//  Tester TesterUITests
//
//  Created by Brenton Durkee on 12/18/15.
//  Copyright © 2015 Test. All rights reserved.
//

import XCTest

class Tester_TesterUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.tables.element.cells.elementBoundByIndex(4).tap()
        let textField = app.otherElements.containingType(.NavigationBar, identifier:"Tester_Tester.PostView").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.TextField).element
        textField.tap()
        textField.typeText("hello")
        var commentsViewValue = app.textViews.element.value as? String
        XCTAssertEqual(commentsViewValue, "")
        app.buttons["Add Comment"].tap()
        commentsViewValue = app.textViews.element.value as? String
        XCTAssertEqual(commentsViewValue, "\nhello")

        
    }
    
}
