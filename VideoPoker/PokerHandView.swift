//
//  PokerHandView.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

class PokerHandView: NSView {
    private var cards: [CardView] = []
    
    var backgroundColor: NSColor = NSColor(calibratedRed: 0.4, green: 1, blue: 0.4, alpha: 1) {
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
        
        for i in 0...4 {
            let card = CardView(frame: makeRectForCardAtIndex(i), cardIndex: i, imageSource: imageSource)
            addSubview(card)
            cards.append(card)
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
