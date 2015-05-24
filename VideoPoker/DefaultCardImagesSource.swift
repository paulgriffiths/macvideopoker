//
//  DefaultCardImagesSource.swift
//
//  Class for default source of playing card images.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
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
