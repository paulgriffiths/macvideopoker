//
//  RankCounterTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class RankCounterTests: XCTestCase {
    
    var counter: RankCounter?

    override func setUp() {
        super.setUp()
        
        counter = RankCounter(list: CardList(cards: Cards.ThreeClubs.card, Cards.FiveHearts.card,
            Cards.FiveDiamonds.card, Cards.SixSpades.card, Cards.SixHearts.card, Cards.NineHearts.card,
            Cards.NineClubs.card, Cards.NineSpades.card, Cards.JackDiamonds.card, Cards.QueenSpades.card,
            Cards.KingDiamonds.card, Cards.AceSpades.card, Cards.AceClubs.card))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCountForRank() {
        XCTAssertEqual(2, counter!.countForRank(.Ace))
        XCTAssertEqual(0, counter!.countForRank(.Two))
        XCTAssertEqual(1, counter!.countForRank(.Three))
        XCTAssertEqual(0, counter!.countForRank(.Four))
        XCTAssertEqual(2, counter!.countForRank(.Five))
        XCTAssertEqual(2, counter!.countForRank(.Six))
        XCTAssertEqual(0, counter!.countForRank(.Seven))
        XCTAssertEqual(0, counter!.countForRank(.Eight))
        XCTAssertEqual(3, counter!.countForRank(.Nine))
        XCTAssertEqual(0, counter!.countForRank(.Ten))
        XCTAssertEqual(1, counter!.countForRank(.Jack))
        XCTAssertEqual(1, counter!.countForRank(.Queen))
        XCTAssertEqual(1, counter!.countForRank(.King))
    }

    func testContainsRank() {
        XCTAssertTrue(counter!.containsRank(.Ace))
        XCTAssertFalse(counter!.containsRank(.Two))
        XCTAssertTrue(counter!.containsRank(.Three))
        XCTAssertFalse(counter!.containsRank(.Four))
        XCTAssertTrue(counter!.containsRank(.Five))
        XCTAssertTrue(counter!.containsRank(.Six))
        XCTAssertFalse(counter!.containsRank(.Seven))
        XCTAssertFalse(counter!.containsRank(.Eight))
        XCTAssertTrue(counter!.containsRank(.Nine))
        XCTAssertFalse(counter!.containsRank(.Ten))
        XCTAssertTrue(counter!.containsRank(.Jack))
        XCTAssertTrue(counter!.containsRank(.Queen))
        XCTAssertTrue(counter!.containsRank(.King))
    }
    
    func testNumRanks() {
        XCTAssertEqual(8, counter!.numRanks())
    }

}
