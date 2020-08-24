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
        
        // Add tracking area for hover effects on OS X 10.14 and later
        // Could also include the cursor updates in this tracking but kept it separate for the sake of recording examples
        if #available(OSX 10.14, *) {
            let trackingArea = NSTrackingArea(rect: bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self, userInfo: nil)
            self.addTrackingArea(trackingArea)
        }
    }
    
    override func mouseEntered(with event: NSEvent) {
        super.mouseEntered(with: event)
        if #available(OSX 10.14, *) {
            if effectiveAppearance.name == .darkAqua || effectiveAppearance.name == .vibrantDark {
                self.contentTintColor = .white
            } else {
                self.contentTintColor = .black
            }
        }
    }

    override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        if #available(OSX 10.14, *) {
            self.contentTintColor = .none
        }
    }
    
    override func resetCursorRects() {
        addCursorRect(bounds, cursor: .pointingHand)
    }
}
