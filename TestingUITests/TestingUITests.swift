//
//  TestingUITests.swift
//  TestingUITests
//
//  Created by Emir Türk on 13.04.2023.
//

import XCTest

final class TestingUITests: XCTestCase {

   

    func testToDo() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        
        let addButton = app.navigationBars["Testing.View"].buttons["Add"]
        let elementsQuery = app.alerts["Add task"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Duty"]/*[[".cells.textFields[\"Enter Duty\"]",".textFields[\"Enter Duty\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okButton = elementsQuery.buttons["Ok"]
        let addCell = app.tables.cells.containing(.staticText, identifier:"add task").element
                                                
                
        addButton.tap()
        textField.tap()
        textField.typeText("add task")
        okButton.tap()
        
        XCTAssertTrue(addCell.exists)
    }

    
    
    func testDeleteItem() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["Testing.View"].buttons["Add"]
        let elementsQuery = app.alerts["Add task"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Duty"]/*[[".cells.textFields[\"Enter Duty\"]",".textFields[\"Enter Duty\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okButton = elementsQuery.buttons["Ok"]
        let addCell = app.tables.cells.containing(.staticText, identifier:"add task").element
        
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
                
        addButton.tap()
        textField.tap()
        textField.typeText("add task")
        okButton.tap()
        
        addCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addCell.exists)
              
        
    }
   
}
