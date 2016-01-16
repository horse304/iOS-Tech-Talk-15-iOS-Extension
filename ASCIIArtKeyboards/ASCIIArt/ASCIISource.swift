//
//  ASCIISource.swift
//  ASCIIArtKeyboards
//
//  Created by Nguyen Dat on 1/16/16.
//  Copyright © 2016 Atlassian. All rights reserved.
//

import Foundation

struct ASCIIItem {
    var text: String
}

struct ASCIISource {
    var items: [ASCIIItem]
}

let DemoSource = ASCIISource(items: [
    ASCIIItem(text: "( ͡° ͜ʖ ͡°)"),
    ASCIIItem(text: "༼ つ ◕_◕ ༽つ"),
    ASCIIItem(text: "¯\\_(ツ)_/¯"),
    ASCIIItem(text: "¸¸♬·¯·♩¸¸♪·¯·♫¸¸Happy Birthday To You¸¸♬·¯·♩¸¸♪·¯·♫¸¸"),
    ASCIIItem(text: "▄︻̷̿┻̿═━一"),
    ASCIIItem(text: "( •_•)O*¯`·.¸.·´¯`°Q(•_• )"),
    ASCIIItem(text: "(Ͼ˳Ͽ)..!!!"),
    ASCIIItem(text: "\\m/_(>_<)_\\m/"),
])
