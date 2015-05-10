//
//  CardImagesSource.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

protocol CardImagesSource {
    func cardImageForIndex(index: Int) -> NSImage?
    var cardBackImage: NSImage? { get }
    var cardSize: NSSize { get }
}