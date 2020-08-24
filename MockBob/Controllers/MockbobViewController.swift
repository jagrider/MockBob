//
//  MockbobViewController.swift
//  MockBob
//
//  Created by Jonathan Grider on 5/20/20.
//  Copyright © 2020 Jonathan Grider. All rights reserved.
//

import Cocoa

class MockbobViewController: NSViewController, NSTextViewDelegate {
    
    @IBOutlet weak var mockScrollView: NSScrollView!
    @IBOutlet var mockTextView: NSTextView!
    
    @IBOutlet weak var pasteButton: MBPointerButton!
    @IBOutlet weak var clearButton: MBPointerButton!
    @IBOutlet weak var copyButton: MBPointerButton!
    @IBOutlet weak var quitButton: MBPointerButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        mockTextView.drawsBackground = false
        
        // Set inner padding on text field so it doesn't appear right next to the borders
        mockTextView.textContainerInset = NSSize(width: 10, height: 12)
        
        // Do view setup here.
        mockTextView.delegate = self;
    }
    
    override func viewDidAppear() {
        NSApplication.shared.activate(ignoringOtherApps: true)
    }
    
    static func freshController() -> MockbobViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(stringLiteral: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(stringLiteral: "MockbobViewController")
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? MockbobViewController else {
            fatalError("Unable to find viewcontroller")
        }
        
        return viewController;
    }
    
    // MARK: Acitons
    @IBAction func pasteFromClipboard(_ sender: NSButton) {
        // Set the text field to have the value of the clipboard
        let pasteBoard = NSPasteboard.general
        mockTextView.string = mockbob(pasteBoard.string(forType: .string) ?? "")
    }
    
    @IBAction func copyToClipboard(_ sender: NSButton) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.setString(mockTextView.string, forType: .string)
    }
    
    @IBAction func quitApp(sender: AnyObject) {
        NSApplication.shared.terminate(self)
    }
    
    @IBAction func clearTextView(_ sender: NSButton) {
        mockTextView.string = ""
    }
    
    // MARK: MockBob Logic
    func textDidChange(_ notification: Notification) {
        guard let textField = notification.object as? NSTextView else {
            assertionFailure("Unable to interpret text field change")
            return;
        }
        
        textField.string = mockbob(textField.string);
    }
    
    // Update the string to be in mockbob form
    func mockbob(_ text: String) -> String {
        var updated: String = "";
        for char in text {
            updated += Int.random(in: 0..<100) < 50 ? char.uppercased() : char.lowercased()
        }
        return updated
    }
}
