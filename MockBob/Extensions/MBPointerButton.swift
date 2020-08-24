//
//  MBPointerButton.swift
//  MockBob
//
//  Created by Jonathan Grider on 8/23/20.
//  Copyright © 2020 Jonathan Grider. All rights reserved.
//
//  Simple subclass to add a cursor pointer effect to buttons
//

import Cocoa

class MBPointerButton: NSButton {
    
    private var originalTemplateFlag: Bool = false
    
    
    var cursor = NSCursor()

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        if let image = self.image {
            image.isTemplate = true
        }

    }
    
    override func resetCursorRects() {
        addCursorRect(bounds, cursor: .pointingHand)
    }
}
