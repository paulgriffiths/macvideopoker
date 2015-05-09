//
//  PokerHandEvaluationComparisonTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class PokerHandEvaluationComparisonTests: XCTestCase {

    func testHighCardAllSimilar() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.JackHearts, Cards.NineSpades,
            Cards.SevenClubs, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.HighCard, e1.handType)
        XCTAssertEqual(PokerHands.HighCard, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testHighCardFirstDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.QueenDiamonds, Cards.JackHearts, Cards.NineSpades,
            Cards.SevenClubs, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.HighCard, e1.handType)
        XCTAssertEqual(PokerHands.HighCard, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testHighCardSecondDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.TenHearts, Cards.NineSpades,
            Cards.SevenClubs, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.HighCard, e1.handType)
        XCTAssertEqual(PokerHands.HighCard, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testHighCardThirdDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.JackHearts, Cards.EightSpades,
            Cards.SevenClubs, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.HighCard, e1.handType)
        XCTAssertEqual(PokerHands.HighCard, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testHighCardFourthDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.JackHearts, Cards.NineSpades,
            Cards.SixClubs, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.HighCard, e1.handType)
        XCTAssertEqual(PokerHands.HighCard, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testHighCardFifthDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.JackHearts, Cards.NineSpades,
            Cards.SevenClubs, Cards.FourDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.HighCard, e1.handType)
        XCTAssertEqual(PokerHands.HighCard, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testPairPairSameSinglesSame() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.JackSpades, Cards.JackHearts, Cards.NineSpades,
            Cards.SevenClubs, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Pair, e1.handType)
        XCTAssertEqual(PokerHands.Pair, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testPairPairDifferentSinglesSame() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.TenSpades, Cards.TenHearts, Cards.NineSpades,
            Cards.SevenClubs, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Pair, e1.handType)
        XCTAssertEqual(PokerHands.Pair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testPairPairDifferentSinglesDifferent() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.TenSpades, Cards.TenHearts, Cards.AceSpades,
            Cards.KingClubs, Cards.QueenDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Pair, e1.handType)
        XCTAssertEqual(PokerHands.Pair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testPairPairSameTwoSinglesSame() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.JackSpades, Cards.JackHearts, Cards.NineSpades,
            Cards.SevenClubs, Cards.FourDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Pair, e1.handType)
        XCTAssertEqual(PokerHands.Pair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testPairPairSameOneSingleSame() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.JackSpades, Cards.JackHearts, Cards.NineSpades,
            Cards.SixClubs, Cards.FourDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Pair, e1.handType)
        XCTAssertEqual(PokerHands.Pair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testPairPairSameNoSinglesSame() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackDiamonds, Cards.NineHearts,
            Cards.SevenSpades, Cards.FiveHearts)
        let p2 = PokerHand(cards: Cards.JackSpades, Cards.JackHearts, Cards.EightSpades,
            Cards.SixClubs, Cards.FourDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Pair, e1.handType)
        XCTAssertEqual(PokerHands.Pair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testTwoPairPairsSameSingleSame() {
        let p1 = PokerHand(cards: Cards.NineClubs, Cards.NineDiamonds, Cards.SixHearts,
            Cards.SixSpades, Cards.AceClubs)
        let p2 = PokerHand(cards: Cards.NineSpades, Cards.NineHearts, Cards.SixDiamonds,
            Cards.SixClubs, Cards.AceSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.TwoPair, e1.handType)
        XCTAssertEqual(PokerHands.TwoPair, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testTwoPairPairsSameSingleDifferent() {
        let p1 = PokerHand(cards: Cards.NineClubs, Cards.NineDiamonds, Cards.SixHearts,
            Cards.SixSpades, Cards.AceClubs)
        let p2 = PokerHand(cards: Cards.NineSpades, Cards.NineHearts, Cards.SixDiamonds,
            Cards.SixClubs, Cards.JackSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.TwoPair, e1.handType)
        XCTAssertEqual(PokerHands.TwoPair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testTwoPairSecondPairDifferent() {
        let p1 = PokerHand(cards: Cards.NineClubs, Cards.NineDiamonds, Cards.SixHearts,
            Cards.SixSpades, Cards.ThreeClubs)
        let p2 = PokerHand(cards: Cards.NineSpades, Cards.NineHearts, Cards.FiveDiamonds,
            Cards.FiveClubs, Cards.JackSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.TwoPair, e1.handType)
        XCTAssertEqual(PokerHands.TwoPair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testTwoPairFirstPairDifferent() {
        let p1 = PokerHand(cards: Cards.NineClubs, Cards.NineDiamonds, Cards.SixHearts,
            Cards.SixSpades, Cards.ThreeClubs)
        let p2 = PokerHand(cards: Cards.EightSpades, Cards.EightHearts, Cards.SevenDiamonds,
            Cards.SevenClubs, Cards.JackSpades)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.TwoPair, e1.handType)
        XCTAssertEqual(PokerHands.TwoPair, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }

    func testThreeThreeSameSinglesSame() {
        let p1 = PokerHand(cards: Cards.QueenClubs, Cards.QueenDiamonds, Cards.QueenHearts,
            Cards.SevenSpades, Cards.ThreeClubs)
        let p2 = PokerHand(cards: Cards.QueenDiamonds, Cards.QueenHearts, Cards.QueenSpades,
            Cards.SevenHearts, Cards.ThreeDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Three, e1.handType)
        XCTAssertEqual(PokerHands.Three, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testThreeThreeSameSinglesDifferent() {
        let p1 = PokerHand(cards: Cards.QueenClubs, Cards.QueenDiamonds, Cards.QueenHearts,
            Cards.SevenSpades, Cards.ThreeClubs)
        let p2 = PokerHand(cards: Cards.QueenDiamonds, Cards.QueenHearts, Cards.QueenSpades,
            Cards.SixHearts, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Three, e1.handType)
        XCTAssertEqual(PokerHands.Three, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testThreeThreeDifferent() {
        let p1 = PokerHand(cards: Cards.QueenClubs, Cards.QueenDiamonds, Cards.QueenHearts,
            Cards.SevenSpades, Cards.ThreeClubs)
        let p2 = PokerHand(cards: Cards.JackDiamonds, Cards.JackHearts, Cards.JackSpades,
            Cards.AceHearts, Cards.KingDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Three, e1.handType)
        XCTAssertEqual(PokerHands.Three, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testStraightSame() {
        let p1 = PokerHand(cards: Cards.TenClubs, Cards.NineDiamonds, Cards.EightHearts,
            Cards.SevenSpades, Cards.SixClubs)
        let p2 = PokerHand(cards: Cards.TenDiamonds, Cards.NineHearts, Cards.EightSpades,
            Cards.SevenClubs, Cards.SixDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Straight, e1.handType)
        XCTAssertEqual(PokerHands.Straight, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testStraightDifferentNormal() {
        let p1 = PokerHand(cards: Cards.TenClubs, Cards.NineDiamonds, Cards.EightHearts,
            Cards.SevenSpades, Cards.SixClubs)
        let p2 = PokerHand(cards: Cards.EightDiamonds, Cards.SevenHearts, Cards.SixSpades,
            Cards.FiveClubs, Cards.FourDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Straight, e1.handType)
        XCTAssertEqual(PokerHands.Straight, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testStraightDifferentWheel() {
        let p1 = PokerHand(cards: Cards.TenClubs, Cards.NineDiamonds, Cards.EightHearts,
            Cards.SevenSpades, Cards.SixClubs)
        let p2 = PokerHand(cards: Cards.FiveDiamonds, Cards.FourHearts, Cards.ThreeSpades,
            Cards.TwoClubs, Cards.AceDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Straight, e1.handType)
        XCTAssertEqual(PokerHands.Straight, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFlushAllSimilar() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackClubs, Cards.NineClubs,
            Cards.SevenClubs, Cards.FiveClubs)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.JackDiamonds, Cards.NineDiamonds,
            Cards.SevenDiamonds, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Flush, e1.handType)
        XCTAssertEqual(PokerHands.Flush, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testFlushFirstDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackClubs, Cards.NineClubs,
            Cards.SevenClubs, Cards.FiveClubs)
        let p2 = PokerHand(cards: Cards.QueenDiamonds, Cards.JackDiamonds, Cards.NineDiamonds,
            Cards.SevenDiamonds, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Flush, e1.handType)
        XCTAssertEqual(PokerHands.Flush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFlushSecondDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackClubs, Cards.NineClubs,
            Cards.SevenClubs, Cards.FiveClubs)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.TenDiamonds, Cards.NineDiamonds,
            Cards.SevenDiamonds, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Flush, e1.handType)
        XCTAssertEqual(PokerHands.Flush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFlushThirdDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackClubs, Cards.NineClubs,
            Cards.SevenClubs, Cards.FiveClubs)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.JackDiamonds, Cards.EightDiamonds,
            Cards.SevenDiamonds, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Flush, e1.handType)
        XCTAssertEqual(PokerHands.Flush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFlushFourthDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackClubs, Cards.NineClubs,
            Cards.SevenClubs, Cards.FiveClubs)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.JackDiamonds, Cards.NineDiamonds,
            Cards.SixDiamonds, Cards.FiveDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Flush, e1.handType)
        XCTAssertEqual(PokerHands.Flush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFlushFifthDifferent() {
        let p1 = PokerHand(cards: Cards.KingClubs, Cards.JackClubs, Cards.NineClubs,
            Cards.SevenClubs, Cards.FiveClubs)
        let p2 = PokerHand(cards: Cards.KingDiamonds, Cards.JackDiamonds, Cards.NineDiamonds,
            Cards.SevenDiamonds, Cards.FourDiamonds)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Flush, e1.handType)
        XCTAssertEqual(PokerHands.Flush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFullHouseAllSame() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackHearts, Cards.JackSpades,
            Cards.SevenClubs, Cards.SevenSpades)
        let p2 = PokerHand(cards: Cards.JackHearts, Cards.JackSpades, Cards.JackDiamonds,
            Cards.SevenDiamonds, Cards.SevenHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.FullHouse, e1.handType)
        XCTAssertEqual(PokerHands.FullHouse, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testFullHouseThreeSamePairDifferent() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackHearts, Cards.JackSpades,
            Cards.SevenClubs, Cards.SevenSpades)
        let p2 = PokerHand(cards: Cards.JackHearts, Cards.JackSpades, Cards.JackDiamonds,
            Cards.SixDiamonds, Cards.SixHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.FullHouse, e1.handType)
        XCTAssertEqual(PokerHands.FullHouse, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFullHouseThreeDifferent() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackHearts, Cards.JackSpades,
            Cards.SevenClubs, Cards.SevenSpades)
        let p2 = PokerHand(cards: Cards.TenHearts, Cards.TenSpades, Cards.TenDiamonds,
            Cards.KingDiamonds, Cards.KingHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.FullHouse, e1.handType)
        XCTAssertEqual(PokerHands.FullHouse, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFourAllSame() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackHearts, Cards.JackSpades,
            Cards.JackDiamonds, Cards.SevenSpades)
        let p2 = PokerHand(cards: Cards.JackClubs, Cards.JackHearts, Cards.JackSpades,
            Cards.JackDiamonds, Cards.SevenHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Four, e1.handType)
        XCTAssertEqual(PokerHands.Four, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testFourFourSameSingleDifferent() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackHearts, Cards.JackSpades,
            Cards.JackDiamonds, Cards.SevenSpades)
        let p2 = PokerHand(cards: Cards.JackClubs, Cards.JackHearts, Cards.JackSpades,
            Cards.JackDiamonds, Cards.SixHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Four, e1.handType)
        XCTAssertEqual(PokerHands.Four, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testFourFourDifferent() {
        let p1 = PokerHand(cards: Cards.JackClubs, Cards.JackHearts, Cards.JackSpades,
            Cards.JackDiamonds, Cards.SevenSpades)
        let p2 = PokerHand(cards: Cards.TenClubs, Cards.TenHearts, Cards.TenSpades,
            Cards.TenDiamonds, Cards.KingHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.Four, e1.handType)
        XCTAssertEqual(PokerHands.Four, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }

    func testStraightFlushSame() {
        let p1 = PokerHand(cards: Cards.TenSpades, Cards.NineSpades, Cards.EightSpades,
            Cards.SevenSpades, Cards.SixSpades)
        let p2 = PokerHand(cards: Cards.TenHearts, Cards.NineHearts, Cards.EightHearts,
            Cards.SevenHearts, Cards.SixHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.StraightFlush, e1.handType)
        XCTAssertEqual(PokerHands.StraightFlush, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    func testStraightFlushDifferentNormal() {
        let p1 = PokerHand(cards: Cards.TenSpades, Cards.NineSpades, Cards.EightSpades,
            Cards.SevenSpades, Cards.SixSpades)
        let p2 = PokerHand(cards: Cards.FiveHearts, Cards.NineHearts, Cards.EightHearts,
            Cards.SevenHearts, Cards.SixHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.StraightFlush, e1.handType)
        XCTAssertEqual(PokerHands.StraightFlush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testStraightFlushDifferentWheel() {
        let p1 = PokerHand(cards: Cards.TenSpades, Cards.NineSpades, Cards.EightSpades,
            Cards.SevenSpades, Cards.SixSpades)
        let p2 = PokerHand(cards: Cards.FiveHearts, Cards.FourHearts, Cards.ThreeHearts,
            Cards.TwoHearts, Cards.AceHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.StraightFlush, e1.handType)
        XCTAssertEqual(PokerHands.StraightFlush, e2.handType)
        XCTAssertGreaterThan(e1, e2)
    }
    
    func testRoyalFlush() {
        let p1 = PokerHand(cards: Cards.TenSpades, Cards.JackSpades, Cards.QueenSpades,
            Cards.KingSpades, Cards.AceSpades)
        let p2 = PokerHand(cards: Cards.TenHearts, Cards.JackHearts, Cards.QueenHearts,
            Cards.KingHearts, Cards.AceHearts)
        
        let e1 = PokerHandEvaluation(hand: p1)
        let e2 = PokerHandEvaluation(hand: p2)
        
        XCTAssertEqual(PokerHands.RoyalFlush, e1.handType)
        XCTAssertEqual(PokerHands.RoyalFlush, e2.handType)
        XCTAssertEqual(e1, e2)
    }
    
    
}
