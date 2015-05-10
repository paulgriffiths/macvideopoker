//
//  CardView.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

class CardView: NSView {
    
    var imageSource: CardImagesSource {
        didSet {
            needsDisplay = true
        }
    }
    
    var cardIndex: Int? {
        didSet {
            needsDisplay = true
        }
    }
    
    var isFaceDown: Bool = false {
        didSet {
            needsDisplay = true
        }
    }
    
    var enabled: Bool = true
    
    required init?(coder: NSCoder) {
        cardIndex = 0
        imageSource = DefaultCardImagesSource()
        super.init(coder: coder)
    }
    
    convenience override init(frame: CGRect) {
        self.init(frame: frame, cardIndex: nil, imageSource: DefaultCardImagesSource())
    }
    
    convenience init(frame: CGRect, imageSource: CardImagesSource) {
        self.init(frame: frame, cardIndex: nil, imageSource: imageSource)
    }
    
    init(frame: CGRect, cardIndex: Int?, imageSource: CardImagesSource) {
        self.cardIndex = cardIndex
        self.imageSource = imageSource
        super.init(frame: frame)
    }
    
    override func drawRect(dirtyRect: NSRect) {
        if let cardIndex = cardIndex {
            let image = isFaceDown ? imageSource.cardBackImage : imageSource.cardImageForIndex(cardIndex)
            image?.drawInRect(bounds)
        }
    }
    
    override func mouseUp(theEvent: NSEvent) {
        if enabled && cardIndex != nil {
            isFaceDown = !isFaceDown
        }
    }
    
    var intrinsticContentSize: NSSize {
        return imageSource.cardSize
    }
}
