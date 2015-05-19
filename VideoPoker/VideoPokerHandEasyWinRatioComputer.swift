//
//  VideoPokerHandWinRatioComputer.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/19/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

final class VideoPokerHandEasyWinRatioComputer: PokerHandWinRatioComputer {
    override func winRatioForHand(hand: PokerHands) -> Int {
        switch hand {
        case .RoyalFlush:
            return 2500
        case .StraightFlush:
            return 250
        case .Four:
            return 100
        case .FullHouse:
            return 50
        case .Flush:
            return 20
        case .Straight:
            return 15
        case .Three:
            return 4
        case .TwoPair:
            return 3
        case .Pair:
            return 2
        case .HighCard:
            return 0
        }
    }
}