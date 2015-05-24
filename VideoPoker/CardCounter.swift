//
//  CardCounter.swift
//
//  Utility struct to calculate information about the cards in
//  a list of playing cards, for instance which ranks and suits
//  are present, or the rank of the highest pair, or whether
//  the cards constitute a straight.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

struct CardCounter {
    
    private let suitCounter: SuitCounter
    private let rankCounter: RankCounter
    private let rankComboCounter: RankComboCounter
    let count: Int
    
    init(cardList: CardList) {
        suitCounter = SuitCounter(cardList: cardList)
        rankCounter = RankCounter(cardList: cardList)
        rankComboCounter = RankComboCounter(rankCounter: rankCounter)
        count = cardList.count
    }
    
    init(hand: PokerHand) {
        suitCounter = SuitCounter(cardList: hand.cards)
        rankCounter = RankCounter(cardList: hand.cards)
        rankComboCounter = RankComboCounter(rankCounter: rankCounter)
        count = hand.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var numRanks: Int {
        return rankCounter.count
    }
    
    var numSuits: Int {
        return suitCounter.count
    }
    
    var isFlush: Bool {
        return numSuits == 1
    }
    
    var isStraight: Bool {
        return isAllSingles && areSinglesStraight
    }
    
    func containsRank(rank: Rank) -> Bool {
        return rankCounter.containsRank(rank)
    }
    
    func containsSuit(suit: Suit) -> Bool {
        return suitCounter.containsSuit(suit)
    }
    
    func countForRank(rank: Rank) -> Int {
        return rankCounter.countForRank(rank)
    }
    
    func countForSuit(suit: Suit) -> Int {
        return suitCounter.countForSuit(suit)
    }
    
    func numberRankByCount(comboCount: Int) -> Int {
        return rankComboCounter.numberByCount(comboCount)
    }
    
    func containsRankCount(comboCount: Int) -> Bool {
        return rankComboCounter.containsCount(comboCount)
    }
    
    func highestRankByCount(comboCount: Int) -> Rank? {
        return rankComboCounter.highestByCount(comboCount)
    }
    
    func secondHighestRankByCount(comboCount: Int) -> Rank? {
        return rankComboCounter.secondHighestByCount(comboCount)
    }
    
    func lowestRankByCount(comboCount: Int) -> Rank? {
        return rankComboCounter.lowestByCount(comboCount)
    }
    
    func rankRangeByCount(comboCount: Int) -> Int? {
        return rankComboCounter.rangeByCount(comboCount)
    }
    
    func rankScoreByCount(comboCount: Int) -> Int? {
        return rankComboCounter.scoreByCount(comboCount)
    }
    
    private var isAllSingles: Bool {
        return !isEmpty && numberRankByCount(1) == count
    }
    
    private var areSinglesStraight: Bool {
        return areSinglesNonWheelStraight || areSinglesWheelStraight
    }
    
    private var areSinglesNonWheelStraight: Bool {
        if let singlesRange = rankRangeByCount(1) {
            return singlesRange == numberRankByCount(1) - 1
        }
        else {
            return false
        }
    }
    
    private var areSinglesWheelStraight: Bool {
        if let highestRank = highestRankByCount(1) {
            if highestRank == Rank.Ace {
                if numberRankByCount(1) == 1 {
                    return true
                }
                else if let lowestRank = lowestRankByCount(1), let secondHighestRank = secondHighestRankByCount(1) {
                    if lowestRank == Rank.Two && (secondHighestRank.value - lowestRank.value == numberRankByCount(1) - 2) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
}