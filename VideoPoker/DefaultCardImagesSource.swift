//
//  DefaultCardImagesSource.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

class DefaultCardImagesSource: CardImagesSource {
    func cardImageForIndex(index: Int) -> NSImage? {
        return NSImage(named: String(format: "card%d", index))
    }
    
    var cardBackImage: NSImage? {
        return NSImage(named: "card_back_blue")
    }
    
    var cardSize: NSSize {
        return NSSize(width: 100, height: 142)
    }
}
