//
//  HandTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/10/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class HandTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExchange() {
        let deck = Deck()
        let hand = Hand(cardList: deck.drawCards(5))
        XCTAssertEqual(5, hand.count)
        XCTAssertEqual(47, deck.count)
        XCTAssertEqual(0, deck.discardsCount)
        XCTAssertEqual("[KD,QD,JD,TD,9D]", hand.description)
        
        let exchangeArray = [1, 3]
        hand.exchange(deck, exchangeArray: exchangeArray)
        XCTAssertEqual(5, hand.count)
        XCTAssertEqual(45, deck.count)
        XCTAssertEqual(2, deck.discardsCount)
        XCTAssertEqual("[KD,8D,JD,7D,9D]", hand.description)
    }

}
