//
//  PokerHandView.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

final class PokerHandView: NSView {
    private var cards: [CardView] = []
    private let numberOfCards = 5
    
    var hand: PokerHand? {
        didSet {
            resetCards()
        }
    }
    
    var backgroundColor: NSColor = NSColor(calibratedRed: 0.3, green: 0.8, blue: 0.3, alpha: 1) {
        didSet {
            needsDisplay = true
        }
    }
    
    var imageSource: CardImagesSource = DefaultCardImagesSource() {
        didSet {
            for card in cards {
                card.imageSource = imageSource
            }
        }
    }
    
    var enabled: Bool = true {
        didSet {
            for card in cards {
                card.enabled = enabled
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeCards()
    }
    
    var flippedArray: [Int] {
        var array: [Int] = []
        for (index, card) in enumerate(cards) {
            if card.isFaceDown {
                array.append(index)
            }
        }
        return array
    }
    
    private func initializeCards() {
        for i in 0..<numberOfCards {
            let card = CardView(frame: makeRectForCardAtIndex(i), cardIndex: nil, imageSource: imageSource)
            addSubview(card)
            cards.append(card)
        }
    }
    
    private func resetCards() {
        if let hand = hand {
            for (index, card) in enumerate(hand) {
                cards[index].cardIndex = card.index
                cards[index].isFaceDown = false
            }
        }
        else {
            for index in 0..<numberOfCards {
                cards[index].cardIndex = nil
            }
        }
    }
    
    private func makeRectForCardAtIndex(index: Int) -> NSRect {
        let padding: CGFloat = 5.0
        let width = imageSource.cardSize.width
        let height = imageSource.cardSize.height
        let x = width * CGFloat(index) + padding * (CGFloat(index) + 1)
        let y = padding
        return NSRect(origin: NSPoint(x: x, y: y), size: NSSize(width: width, height: height))
    }
    
    override func drawRect(dirtyRect: NSRect) {
        backgroundColor.set()
        NSBezierPath(rect: bounds).fill()
    }
}
