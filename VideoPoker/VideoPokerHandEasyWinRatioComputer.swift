//
//  VideoPokerHandEasyWinRatioComputer.swift
//
//  Class for calculating the easy win ratio of a specified video poker hand.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

final class VideoPokerHandEasyWinRatioComputer: PokerHandWinRatioComputer {
    override func winRatioForHand(hand: PokerHand) -> (winRatio: Int, description: String) {
        let pe = PokerHandEvaluation(hand: hand)
        
        switch pe.handType {
        case .RoyalFlush:
            return (2500, "Royal flush")
            
        case .StraightFlush:
            return (250, "Straight flush")
            
        case .Four:
            return (100, "Four of a kind")
            
        case .FullHouse:
            return (50 ,"Full house")
            
        case .Flush:
            return (20, "Flush")
            
        case .Straight:
            return (15, "Straight")
            
        case .Three:
            return (4, "Three of a kind")
            
        case .TwoPair:
            return (3, "Two pair")
            
        case .Pair:
            if pe.topLevelRankScore >= .Jack {
                return (2, "Jacks or better")
            }
            else {
                return (0, "Pair")
            }
            
        case .HighCard:
            return (0, "High card")
        }
    }
}