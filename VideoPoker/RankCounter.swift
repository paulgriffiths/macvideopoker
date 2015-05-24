//
//  RankCounter.swift
//
//  Utility struct to calculate the numbers of distinct ranks
//  in a list of playing cards, for instance to determine how
//  many fives or jacks are present in the list.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

struct RankCounter {
    private var ranks: [Rank : Int] = [:]
    
    init(cardList: CardList) {
        for card in cardList {
            countCard(card)
        }
    }
    
    var count: Int {
        return ranks.count
    }
    
    mutating private func countCard(card: Card) {
        if let count = ranks[card.rank] {
            ranks[card.rank] = count + 1
        }
        else {
            ranks[card.rank] = 1
        }
    }
    
    func containsRank(rank: Rank) -> Bool {
        if ranks[rank] != nil {
            return true
        }
        else {
            return false
        }
    }
    
    func countForRank(rank: Rank) -> Int {
        if let count = ranks[rank] {
            return count
        }
        else {
            return 0
        }
    }
    
    func ranksSet() -> Set<Rank> {
        return Set<Rank>(ranks.keys)
    }
}