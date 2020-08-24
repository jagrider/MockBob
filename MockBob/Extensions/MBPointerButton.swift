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
    
    public var hoverText: String = "Test Tooltip"
    private var hoverPanel: NSPanel = NSPanel()

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        if let image = self.image {
            image.isTemplate = true
        }
    }
    
    override func resetCursorRects() {
        super.resetCursorRects()
        addCursorRect(bounds, cursor: .pointingHand)
    }
    
    override func mouseEntered(with event: NSEvent) {
        super.mouseEntered(with: event)
        
    }
}
