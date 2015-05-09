//
//  RankCounter.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

class RankCounter {
    private var ranks: [Rank : Int] = [:]
    
    init(list: CardList) {
        for card in list {
            countCard(card)
        }
    }
    
    private func countCard(card: Card) {
        if let count = ranks[card.rank] {
            ranks[card.rank] = count + 1
        }
        else {
            ranks[card.rank] = 1
        }
    }
    
    func containsRank(rank: Rank) -> Bool {
        if let _ = ranks[rank] {
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
    
    func numRanks() -> Int {
        return ranks.count
    }
}