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
    
    var cardIndex: Int {
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
        self.init(frame: frame, cardIndex: 0, imageSource: DefaultCardImagesSource())
    }
    
    convenience init(frame: CGRect, imageSource: CardImagesSource) {
        self.init(frame: frame, cardIndex: 0, imageSource: imageSource)
    }
    
    init(frame: CGRect, cardIndex: Int, imageSource: CardImagesSource) {
        self.cardIndex = cardIndex
        self.imageSource = imageSource
        super.init(frame: frame)
    }
    
    override func drawRect(dirtyRect: NSRect) {
        let image: NSImage?
        
        if isFaceDown {
            image = imageSource.cardBackImage
        }
        else {
            image = imageSource.cardImageForIndex(cardIndex)
        }
        
        
        image?.drawInRect(bounds)
    }
    
    private func randomizeImage() {
        cardIndex = Int(arc4random_uniform(51))
    }
    
    override func mouseUp(theEvent: NSEvent) {
        if enabled {
            //randomizeImage()
            isFaceDown = !isFaceDown
        }
    }
    
    var intrinsticContentSize: NSSize {
        return imageSource.cardSize
    }
}
