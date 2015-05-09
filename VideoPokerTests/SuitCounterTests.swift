//
//  SuitCounterTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class SuitCounterTests: XCTestCase {

    var counter: SuitCounter?
    
    override func setUp() {
        super.setUp()
        
        counter = SuitCounter(list: CardList(cards: Cards.AceSpades.card, Cards.AceClubs.card,
            Cards.FiveClubs.card, Cards.SixSpades.card, Cards.NineHearts.card, Cards.NineClubs.card,
            Cards.NineSpades.card, Cards.QueenSpades.card))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCountForSuit() {
        XCTAssertEqual(3, counter!.countForSuit(.Clubs))
        XCTAssertEqual(1, counter!.countForSuit(.Hearts))
        XCTAssertEqual(4, counter!.countForSuit(.Spades))
        XCTAssertEqual(0, counter!.countForSuit(.Diamonds))
    }
    
    func testContainsSuit() {
        XCTAssertTrue(counter!.containsSuit(.Clubs))
        XCTAssertTrue(counter!.containsSuit(.Hearts))
        XCTAssertTrue(counter!.containsSuit(.Spades))
        XCTAssertFalse(counter!.containsSuit(.Diamonds))
    }
    
    func testNumSuits() {
        XCTAssertEqual(3, counter!.numSuits())
    }

}
