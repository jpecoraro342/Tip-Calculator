//
//  TipEasyTests.swift
//  TipEasyTests
//
//  Created by Joseph Pecoraro on 8/17/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import XCTest

class TipRoundingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRoundUpDime() {
        var actual = TipRounder.roundUp(1.30, roundAmount: 0.1)
        var expected = NSDecimalNumber(double: 1.4)
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(1.00, roundAmount: 0.1)
        expected = 1.1
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(-0.37, roundAmount: 0.1)
        expected = -0.3
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(1.77, roundAmount: 0.1)
        expected = 1.80
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
    }
    
    func testRoundDownDime() {
        var actual = TipRounder.roundDown(1.30, roundAmount: 0.1)
        var expected = NSDecimalNumber(double: 1.20)
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(1.00, roundAmount: 0.1)
        expected = 0.9
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(-0.37, roundAmount: 0.1)
        expected = -0.40
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(1.77, roundAmount: 0.1)
        expected = 1.70
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
    }
    
    func testRoundUpQuarter() {
        var actual = TipRounder.roundUp(1.30, roundAmount: 0.25)
        var expected = NSDecimalNumber(double: 1.50)
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(1.00, roundAmount: 0.25)
        expected = 1.25
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(-0.37, roundAmount: 0.25)
        expected = -0.25
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(1.77, roundAmount: 0.25)
        expected = 2.00
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
    }
    
    func testRoundDownQuarter() {
        var actual = TipRounder.roundDown(1.30, roundAmount: 0.25)
        var expected = NSDecimalNumber(double: 1.25)
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(1.00, roundAmount: 0.25)
        expected = 0.75
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(-0.37, roundAmount: 0.25)
        expected = -0.50
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(1.77, roundAmount: 0.25)
        expected = 1.75
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
    }
    
    
    func testRoundUpDollar() {
        var actual = TipRounder.roundUp(1.30, roundAmount: 1)
        var expected = NSDecimalNumber(double: 2.0)
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(1.00, roundAmount: 1)
        expected = 2.0
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(-0.37, roundAmount: 1)
        expected = 0.0
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundUp(1.77, roundAmount: 1)
        expected = 2.0
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
    }
    
    func testRoundDownDollar() {
        var actual = TipRounder.roundDown(1.30, roundAmount: 1)
        var expected = NSDecimalNumber(double: 1.0)
        
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(1.00, roundAmount: 1)
        expected = 0.0
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(-0.37, roundAmount: 1)
        expected = -1.0
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
        
        actual = TipRounder.roundDown(1.77, roundAmount: 1)
        expected = 1.0
        XCTAssert(actual == expected, "Expected: \(expected) Was: \(actual)")
    }
}
