//
//  StyleKit.swift
//  RIG
//
//  Created by Przemysław Kuzia on 7/29/17
//  Copyright (c) 2017 Iterators Mobile. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

public enum Attribute {
    case menuButton
}

public enum Color {
    case baseBlueColor
}


class StyleKit {
    
    // swiftlint:disable cyclomatic_complexity
    
    static func attributedText(text: String, attribute: Attribute) -> NSAttributedString {
        var attributedDictionary = [String: AnyObject]()
        switch attribute {
        case .menuButton:
            attributedDictionary = attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 17 , weight: UIFontWeightThin))
        }
        return NSAttributedString(string: text, attributes: attributedDictionary)
    }
    
    static func colorType(color: Color) -> UIColor {
        switch color {
        case .baseBlueColor:
            return UIColor(hexString: "#24CDDE")!
        }
    }

    
    static func attributedText(color: UIColor, font: UIFont, alignment: NSTextAlignment = .left, underline: Bool = false) -> [String: AnyObject] {
        var attributedText = [String: AnyObject]()
        attributedText[NSForegroundColorAttributeName] = color
        attributedText[NSFontAttributeName] = font
        if underline {
            attributedText[NSUnderlineStyleAttributeName] = NSUnderlineStyle.styleSingle.rawValue as AnyObject
        }
    
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3.5
        paragraphStyle.alignment = alignment

        attributedText[NSParagraphStyleAttributeName] = paragraphStyle
        
        return attributedText
    }
}
