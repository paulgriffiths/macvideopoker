//
//  RankCounter.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
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