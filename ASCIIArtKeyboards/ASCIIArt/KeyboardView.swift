//
//  KeyboardView.swift
//  ASCIIArtKeyboards
//
//  Created by Nguyen Dat on 1/16/16.
//  Copyright © 2016 Atlassian. All rights reserved.
//

import UIKit

protocol KeyboardViewDelegate: class {
    func didSelectASCII(ascii: ASCIIItem, sender: KeyboardView)
}

class KeyboardView: UIView {
    private var source: ASCIISource? {
        didSet {
            collectionView?.reloadData()
        }
    }
    weak var delegate: KeyboardViewDelegate?
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            collectionView.registerClass(ASCIICell.self, forCellWithReuseIdentifier: "ASCIICell")
        }
    }
    
    static func keyboardViewWith(asciiSource: ASCIISource) -> KeyboardView? {
        let keyboard = currentBundle.loadNibNamed("KeyboardView", owner: nil, options: nil).first as? KeyboardView
        keyboard?.source = asciiSource
        return keyboard
    }
}

extension KeyboardView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source?.items.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ASCIICell", forIndexPath: indexPath)
        
        if let cell = cell as? ASCIICell {
            cell.item = source?.items[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 30)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let delegate = delegate, item = source?.items[indexPath.row] {
            delegate.didSelectASCII(item, sender: self)
        }
    }
}

