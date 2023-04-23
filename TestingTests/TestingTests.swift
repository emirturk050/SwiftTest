//
//  TestingTests.swift
//  TestingTests
//
//  Created by Emir Türk on 13.04.2023.
//

import XCTest
@testable import Testing

final class TestingTests: XCTestCase {

    let math = MathematicFunc()
    
    func testAddIntFunction() {
        
        let result = math.addInt(x: 2, y: 5)
        
    XCTAssertEqual(result, 7)
    }

    
    func testMultiplyIntFunction() {
        
        let result = math.multiplyInt(x: 2, y: 5)
        
    XCTAssertEqual(result, 10)
    }
    
    
    func testDivideIntFunction() {
        
        let result = math.divideInt(x: 8, y: 4)
        
    XCTAssertEqual(result, 2)
    }
    
    
    
    
    
    
    
    
    
}
