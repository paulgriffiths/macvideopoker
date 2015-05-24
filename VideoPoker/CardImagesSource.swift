//
//  CardImagesSource.swift
//
//  Protocol for sources of playing card images.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

import Cocoa

protocol CardImagesSource {
    func cardImageForIndex(index: Int) -> NSImage?
    var cardBackImage: NSImage? { get }
    var cardSize: NSSize { get }
}