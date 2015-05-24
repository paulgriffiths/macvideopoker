//
//  VideoPokerHandNormalWinRatioComputer.swift
//
//  Class for calculating the normal win ratio of a specified video poker hand.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

final class VideoPokerHandNormalWinRatioComputer: PokerHandWinRatioComputer {
    override func winRatioForHand(hand: PokerHand) -> (winRatio: Int, description: String) {
        let pe = PokerHandEvaluation(hand: hand)
        
        switch pe.handType {
        case .RoyalFlush:
            return (800, "Royal flush")
            
        case .StraightFlush:
            return (50, "Straight flush")
            
        case .Four:
            return (25, "Four of a kind")
            
        case .FullHouse:
            return (9 ,"Full house")
            
        case .Flush:
            return (6, "Flush")
            
        case .Straight:
            return (4, "Straight")
            
        case .Three:
            return (3, "Three of a kind")
            
        case .TwoPair:
            return (2, "Two pair")
            
        case .Pair:
            if pe.topLevelRankScore >= .Jack {
                return (1, "Jacks or better")
            }
            else {
                return (0, "Pair")
            }
            
        case .HighCard:
            return (0, "High card")
        }
    }
}