//
//  CardsTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class CardsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCardsCard() {
        XCTAssertEqual(Rank.Ace, Cards.AceDiamonds.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.AceClubs.card.suit)
        XCTAssertEqual(Rank.Two, Cards.TwoClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.TwoClubs.card.suit)
        XCTAssertEqual(Rank.Three, Cards.ThreeClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.ThreeClubs.card.suit)
        XCTAssertEqual(Rank.Four, Cards.FourClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.FourClubs.card.suit)
        XCTAssertEqual(Rank.Five, Cards.FiveClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.FiveClubs.card.suit)
        XCTAssertEqual(Rank.Six, Cards.SixClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.SixClubs.card.suit)
        XCTAssertEqual(Rank.Seven, Cards.SevenClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.SevenClubs.card.suit)
        XCTAssertEqual(Rank.Eight, Cards.EightClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.EightClubs.card.suit)
        XCTAssertEqual(Rank.Nine, Cards.NineClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.NineClubs.card.suit)
        XCTAssertEqual(Rank.Ten, Cards.TenClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.TenClubs.card.suit)
        XCTAssertEqual(Rank.Jack, Cards.JackClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.JackClubs.card.suit)
        XCTAssertEqual(Rank.Queen, Cards.QueenClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.QueenClubs.card.suit)
        XCTAssertEqual(Rank.King, Cards.KingClubs.card.rank)
        XCTAssertEqual(Suit.Clubs, Cards.KingClubs.card.suit)
        XCTAssertEqual(Rank.Ace, Cards.AceHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.AceHearts.card.suit)
        XCTAssertEqual(Rank.Two, Cards.TwoHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.TwoHearts.card.suit)
        XCTAssertEqual(Rank.Three, Cards.ThreeHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.ThreeHearts.card.suit)
        XCTAssertEqual(Rank.Four, Cards.FourHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.FourHearts.card.suit)
        XCTAssertEqual(Rank.Five, Cards.FiveHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.FiveHearts.card.suit)
        XCTAssertEqual(Rank.Six, Cards.SixHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.SixHearts.card.suit)
        XCTAssertEqual(Rank.Seven, Cards.SevenHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.SevenHearts.card.suit)
        XCTAssertEqual(Rank.Eight, Cards.EightHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.EightHearts.card.suit)
        XCTAssertEqual(Rank.Nine, Cards.NineHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.NineHearts.card.suit)
        XCTAssertEqual(Rank.Ten, Cards.TenHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.TenHearts.card.suit)
        XCTAssertEqual(Rank.Jack, Cards.JackHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.JackHearts.card.suit)
        XCTAssertEqual(Rank.Queen, Cards.QueenHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.QueenHearts.card.suit)
        XCTAssertEqual(Rank.King, Cards.KingHearts.card.rank)
        XCTAssertEqual(Suit.Hearts, Cards.KingHearts.card.suit)
        XCTAssertEqual(Rank.Ace, Cards.AceSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.AceSpades.card.suit)
        XCTAssertEqual(Rank.Two, Cards.TwoSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.TwoSpades.card.suit)
        XCTAssertEqual(Rank.Three, Cards.ThreeSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.ThreeSpades.card.suit)
        XCTAssertEqual(Rank.Four, Cards.FourSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.FourSpades.card.suit)
        XCTAssertEqual(Rank.Five, Cards.FiveSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.FiveSpades.card.suit)
        XCTAssertEqual(Rank.Six, Cards.SixSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.SixSpades.card.suit)
        XCTAssertEqual(Rank.Seven, Cards.SevenSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.SevenSpades.card.suit)
        XCTAssertEqual(Rank.Eight, Cards.EightSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.EightSpades.card.suit)
        XCTAssertEqual(Rank.Nine, Cards.NineSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.NineSpades.card.suit)
        XCTAssertEqual(Rank.Ten, Cards.TenSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.TenSpades.card.suit)
        XCTAssertEqual(Rank.Jack, Cards.JackSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.JackSpades.card.suit)
        XCTAssertEqual(Rank.Queen, Cards.QueenSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.QueenSpades.card.suit)
        XCTAssertEqual(Rank.King, Cards.KingSpades.card.rank)
        XCTAssertEqual(Suit.Spades, Cards.KingSpades.card.suit)
        XCTAssertEqual(Rank.Ace, Cards.AceDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.AceDiamonds.card.suit)
        XCTAssertEqual(Rank.Two, Cards.TwoDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.TwoDiamonds.card.suit)
        XCTAssertEqual(Rank.Three, Cards.ThreeDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.ThreeDiamonds.card.suit)
        XCTAssertEqual(Rank.Four, Cards.FourDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.FourDiamonds.card.suit)
        XCTAssertEqual(Rank.Five, Cards.FiveDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.FiveDiamonds.card.suit)
        XCTAssertEqual(Rank.Six, Cards.SixDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.SixDiamonds.card.suit)
        XCTAssertEqual(Rank.Seven, Cards.SevenDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.SevenDiamonds.card.suit)
        XCTAssertEqual(Rank.Eight, Cards.EightDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.EightDiamonds.card.suit)
        XCTAssertEqual(Rank.Nine, Cards.NineDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.NineDiamonds.card.suit)
        XCTAssertEqual(Rank.Ten, Cards.TenDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.TenDiamonds.card.suit)
        XCTAssertEqual(Rank.Jack, Cards.JackDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.JackDiamonds.card.suit)
        XCTAssertEqual(Rank.Queen, Cards.QueenDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.QueenDiamonds.card.suit)
        XCTAssertEqual(Rank.King, Cards.KingDiamonds.card.rank)
        XCTAssertEqual(Suit.Diamonds, Cards.KingDiamonds.card.suit)
    }
}
