//
//  PokerHandScore.swift
//
//  Struct to score a poker hand.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

private let numberComponents = 3

private func calculateHandType(counter: CardCounter) -> PokerHands {
    if counter.isFlush && counter.isStraight {
        if counter.lowestRankByCount(1) == Rank.Ten {
            return .RoyalFlush
        }
        else {
            return .StraightFlush
        }
    }
    else if counter.numberRankByCount(4) == 1 {
        return .Four
    }
    else if counter.numberRankByCount(3) == 1 && counter.numberRankByCount(2) == 1 {
        return .FullHouse
    }
    else if counter.isFlush {
        return .Flush
    }
    else if counter.isStraight {
        return .Straight
    }
    else if counter.numberRankByCount(3) == 1 {
        return .Three
    }
    else if counter.numberRankByCount(2) == 2 {
        return .TwoPair
    }
    else if counter.numberRankByCount(2) == 1 {
        return .Pair
    }
    else {
        return .HighCard
    }
}

private func createScoreArray(components: Int...) -> [Int] {
    precondition(components.count <= 3)
    return components
}

private func calculateScore(handType: PokerHands, counter: CardCounter) -> [Int] {
    switch handType {
    case .RoyalFlush:
        return []
        
    case .StraightFlush, .Straight:
        return createScoreArray(counter.lowestRankByCount(1)!.value)
        
    case .Four:
        return createScoreArray(counter.highestRankByCount(4)!.value, counter.highestRankByCount(1)!.value)
        
    case .FullHouse:
        return createScoreArray(counter.highestRankByCount(3)!.value, counter.highestRankByCount(2)!.value)
        
    case .Flush, .HighCard:
        return createScoreArray(counter.rankScoreByCount(1)!)
        
    case .Three:
        return createScoreArray(counter.highestRankByCount(3)!.value, counter.rankScoreByCount(1)!)
        
    case .TwoPair:
        return createScoreArray(counter.highestRankByCount(2)!.value, counter.lowestRankByCount(2)!.value,
            counter.highestRankByCount(1)!.value)
        
    case .Pair:
        return createScoreArray(counter.highestRankByCount(2)!.value, counter.rankScoreByCount(1)!)
    }
}

func ==(first: PokerHandScore, second: PokerHandScore) -> Bool {
    return first.handType == second.handType && first.score == second.score
}

func <(first: PokerHandScore, second: PokerHandScore) -> Bool {
    if first.handType < second.handType {
        return true
    }
    else {
        for i in 0...2 {
            if first.score[i] < second.score[i] {
                return true
            }
        }
        return false
    }
}

struct PokerHandScore: Equatable, Comparable {
    let handType: PokerHands
    let score: [Int]
    
    init(counter: CardCounter) {
        self.handType = calculateHandType(counter)
        self.score = calculateScore(self.handType, counter)
    }
}
