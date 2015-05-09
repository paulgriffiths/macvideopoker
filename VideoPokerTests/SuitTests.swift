//
//  SuitTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class SuitTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSuitFromIndex() {
        XCTAssertEqual(Suit.Clubs, Suit.fromIndex(0))
        XCTAssertEqual(Suit.Hearts, Suit.fromIndex(1))
        XCTAssertEqual(Suit.Spades, Suit.fromIndex(2))
        XCTAssertEqual(Suit.Diamonds, Suit.fromIndex(3))
    }
    
    func testEquality() {
        XCTAssertTrue(Suit.Clubs == Suit.Clubs)
        XCTAssertTrue(Suit.Hearts == Suit.Hearts)
        XCTAssertTrue(Suit.Spades == Suit.Spades)
        XCTAssertTrue(Suit.Diamonds == Suit.Diamonds)
    }
    
    func testInequality() {
        XCTAssertTrue(Suit.Clubs != Suit.Hearts)
        XCTAssertTrue(Suit.Hearts != Suit.Spades)
        XCTAssertTrue(Suit.Spades != Suit.Diamonds)
        XCTAssertTrue(Suit.Diamonds != Suit.Clubs)
    }
}
