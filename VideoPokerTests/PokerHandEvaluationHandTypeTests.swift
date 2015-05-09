//
//  PokerHandEvaluationTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class PokerHandEvaluationHandTypeTests: XCTestCase {

    func testRoyalFlushBeatsStraightFlush() {
        let p1 = PokerHand(cards: Cards.AceClubs, Cards.KingClubs, Cards.QueenClubs,
            Cards.JackClubs, Cards.TenClubs)
        let p2 = PokerHand(cards: Cards.KingSpades, Cards.QueenSpades, Cards.JackSpades,
            Cards.TenSpades, Cards.NineSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.RoyalFlush, e1.handType)
        XCTAssertEqual(PokerHands.StraightFlush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testStraightFlushBeatsFourOfAKind() {
        let p1 = PokerHand(cards: Cards.KingSpades, Cards.QueenSpades, Cards.JackSpades,
            Cards.TenSpades, Cards.NineSpades)
        let p2 = PokerHand(cards: Cards.AceSpades, Cards.AceDiamonds, Cards.AceHearts,
            Cards.AceClubs, Cards.ThreeSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.StraightFlush, e1.handType)
        XCTAssertEqual(PokerHands.Four, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFourOfAKindBeatsFullHouse() {
        let p1 = PokerHand(cards: Cards.AceSpades, Cards.AceDiamonds, Cards.AceHearts,
            Cards.AceClubs, Cards.ThreeSpades)
        let p2 = PokerHand(cards: Cards.AceSpades, Cards.AceDiamonds, Cards.AceHearts,
            Cards.ThreeClubs, Cards.ThreeSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Four, e1.handType)
        XCTAssertEqual(PokerHands.FullHouse, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFullHouseBeatsFlush() {
        let p1 = PokerHand(cards: Cards.AceSpades, Cards.AceDiamonds, Cards.AceHearts,
            Cards.ThreeClubs, Cards.ThreeSpades)
        let p2 = PokerHand(cards: Cards.AceSpades, Cards.ThreeSpades, Cards.FiveSpades,
            Cards.SevenSpades, Cards.NineSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.FullHouse, e1.handType)
        XCTAssertEqual(PokerHands.Flush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }

    func testFlushBeatsStraight() {
        let p1 = PokerHand(cards: Cards.AceSpades, Cards.ThreeSpades, Cards.FiveSpades,
            Cards.SevenSpades, Cards.NineSpades)
        let p2 = PokerHand(cards: Cards.FourSpades, Cards.FiveClubs, Cards.SixHearts,
            Cards.SevenDiamonds, Cards.EightSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Flush, e1.handType)
        XCTAssertEqual(PokerHands.Straight, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testStraightBeatsThreeOfAKind() {
        let p1 = PokerHand(cards: Cards.FourSpades, Cards.FiveClubs, Cards.SixHearts,
            Cards.SevenDiamonds, Cards.EightSpades)
        let p2 = PokerHand(cards: Cards.KingSpades, Cards.KingClubs, Cards.KingHearts,
            Cards.FiveDiamonds, Cards.ThreeSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Straight, e1.handType)
        XCTAssertEqual(PokerHands.Three, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testThreeOfAKindBeatsTwoPair() {
        let p1 = PokerHand(cards: Cards.KingSpades, Cards.KingClubs, Cards.KingHearts,
            Cards.FiveDiamonds, Cards.ThreeSpades)
        let p2 = PokerHand(cards: Cards.KingSpades, Cards.KingClubs, Cards.AceHearts,
            Cards.AceDiamonds, Cards.ThreeSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Three, e1.handType)
        XCTAssertEqual(PokerHands.TwoPair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testTwoPairBeatsPair() {
        let p1 = PokerHand(cards: Cards.KingSpades, Cards.KingClubs, Cards.AceHearts,
            Cards.AceDiamonds, Cards.ThreeSpades)
        let p2 = PokerHand(cards: Cards.JackSpades, Cards.KingClubs, Cards.AceHearts,
            Cards.AceDiamonds, Cards.FourSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.TwoPair, e1.handType)
        XCTAssertEqual(PokerHands.Pair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testPairBeatsHighCard() {
        let p1 = PokerHand(cards: Cards.TwoSpades, Cards.ThreeClubs, Cards.SixHearts,
            Cards.SixDiamonds, Cards.FourSpades)
        let p2 = PokerHand(cards: Cards.JackSpades, Cards.KingClubs, Cards.AceHearts,
            Cards.FiveDiamonds, Cards.FourSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Pair, e1.handType)
        XCTAssertEqual(PokerHands.HighCard, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
}
