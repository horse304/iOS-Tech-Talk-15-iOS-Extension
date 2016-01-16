//
//  KeyboardViewController.swift
//  ASCIIArt
//
//  Created by Nguyen Dat on 1/16/16.
//  Copyright © 2016 Atlassian. All rights reserved.
//

import UIKit
import Settings

let currentBundle = NSBundle(forClass: KeyboardViewController.self)
class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    var keyboardView: KeyboardView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNextKeyboard()
        self.setupDelete()
        self.setupCollectionView()
    }
    
    func setupCollectionView() {
        keyboardView = KeyboardView.keyboardViewWith(DemoSource)
        keyboardView.delegate = self
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(keyboardView)
        
        let topConstraint = NSLayoutConstraint(item: keyboardView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: keyboardView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -40)
        let leftConstraint = NSLayoutConstraint(item: keyboardView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: keyboardView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: 0)
        
        self.view.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }
    
    func setupNextKeyboard() {
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
    
    func setupDelete() {
        if Settings.sharedInstance.enabledDelete {
            
            // Perform custom UI setup here
            self.deleteButton = UIButton(type: .System)
            
            self.deleteButton.setTitle(NSLocalizedString("Delete", comment: "Title for 'Delete' button"), forState: .Normal)
            self.deleteButton.sizeToFit()
            self.deleteButton.translatesAutoresizingMaskIntoConstraints = false
            
            self.deleteButton.addTarget(self, action: "deleteText:", forControlEvents: .TouchUpInside)
            
            self.view.addSubview(self.deleteButton)
            
            let deleteButtonRightSideConstraint = NSLayoutConstraint(item: self.deleteButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0)
            let deleteButtonBottomConstraint = NSLayoutConstraint(item: self.deleteButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
            self.view.addConstraints([deleteButtonRightSideConstraint, deleteButtonBottomConstraint])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    func deleteText(sender: AnyObject?) {
        textDocumentProxy.deleteBackward()
    }
}

extension KeyboardViewController: KeyboardViewDelegate {
    func didSelectASCII(ascii: ASCIIItem, sender: KeyboardView) {
        textDocumentProxy.insertText(ascii.text + "\n")
    }
}
