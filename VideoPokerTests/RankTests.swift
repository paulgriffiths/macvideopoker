//
//  RankTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class RankTests: XCTestCase {

    func testRankFromIndex() {
        XCTAssertEqual(Rank.Ace, Rank.fromIndex(0))
        XCTAssertEqual(Rank.Two, Rank.fromIndex(1))
        XCTAssertEqual(Rank.Three, Rank.fromIndex(2))
        XCTAssertEqual(Rank.Four, Rank.fromIndex(3))
        XCTAssertEqual(Rank.Five, Rank.fromIndex(4))
        XCTAssertEqual(Rank.Six, Rank.fromIndex(5))
        XCTAssertEqual(Rank.Seven, Rank.fromIndex(6))
        XCTAssertEqual(Rank.Eight, Rank.fromIndex(7))
        XCTAssertEqual(Rank.Nine, Rank.fromIndex(8))
        XCTAssertEqual(Rank.Ten, Rank.fromIndex(9))
        XCTAssertEqual(Rank.Jack, Rank.fromIndex(10))
        XCTAssertEqual(Rank.Queen, Rank.fromIndex(11))
        XCTAssertEqual(Rank.King, Rank.fromIndex(12))
    }
    
    func testEquality() {
        XCTAssertTrue(Rank.Ace == Rank.Ace)
        XCTAssertTrue(Rank.Four == Rank.Four)
        XCTAssertTrue(Rank.Ten == Rank.Ten)
        XCTAssertTrue(Rank.King == Rank.King)
    }
    
    func testInequality() {
        XCTAssertTrue(Rank.Ace != Rank.Three)
        XCTAssertTrue(Rank.Four != Rank.Two)
        XCTAssertTrue(Rank.Nine != Rank.King)
        XCTAssertTrue(Rank.Queen != Rank.Jack)
    }
    
    func testLessThan() {
        XCTAssertFalse(Rank.Ace < Rank.Two)
        XCTAssertTrue(Rank.Two < Rank.Three)
        XCTAssertTrue(Rank.Three < Rank.Four)
        XCTAssertTrue(Rank.Four < Rank.Five)
        XCTAssertTrue(Rank.Five < Rank.Six)
        XCTAssertTrue(Rank.Six < Rank.Seven)
        XCTAssertTrue(Rank.Seven < Rank.Eight)
        XCTAssertTrue(Rank.Eight < Rank.Nine)
        XCTAssertTrue(Rank.Nine < Rank.Ten)
        XCTAssertTrue(Rank.Ten < Rank.Jack)
        XCTAssertTrue(Rank.Jack < Rank.Queen)
        XCTAssertTrue(Rank.Queen < Rank.King)
    }
    
    func testGreaterThan() {
        XCTAssertTrue(Rank.Ace > Rank.King)
        XCTAssertTrue(Rank.King > Rank.Queen)
        XCTAssertTrue(Rank.Queen > Rank.Jack)
        XCTAssertTrue(Rank.Jack > Rank.Ten)
        XCTAssertTrue(Rank.Ten > Rank.Nine)
        XCTAssertTrue(Rank.Nine > Rank.Eight)
        XCTAssertTrue(Rank.Eight > Rank.Seven)
        XCTAssertTrue(Rank.Seven > Rank.Six)
        XCTAssertTrue(Rank.Six > Rank.Five)
        XCTAssertTrue(Rank.Five > Rank.Four)
        XCTAssertTrue(Rank.Four > Rank.Three)
        XCTAssertTrue(Rank.Three > Rank.Two)
        XCTAssertFalse(Rank.Two > Rank.Ace)
    }
}
