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
        
        //Tap on 5th thumbnail (Index 4)
        app.tables.element.cells.elementBoundByIndex(4).tap()
        
        let textField = app.otherElements.containingType(.NavigationBar, identifier:"Tester_Tester.PostView").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.TextField).element
        
        //Tap on Text Field to Type Comment
        textField.tap()
        
        //Type Comment: "hello"
        textField.typeText("hello")
        
        //Set-up variable for Text View String Value
        var commentsViewValue = app.textViews.element.value as? String
        
        //Assert commentsViewValue contains nothing before submitting comment
        XCTAssertEqual(commentsViewValue, "")
        
        //Submit Comment
        app.buttons["Add Comment"].tap()
        
        //Verify commentsViewValue contains "hello" after submitting comment
        commentsViewValue = app.textViews.element.value as? String
        XCTAssertEqual(commentsViewValue, "\nhello")

        
    }
    
}
