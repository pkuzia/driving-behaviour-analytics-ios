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
    case menuButton, collectParameterLabel, collectStateLabel, collectDriveItemData, collectDriveItemHeader, collectDriveValueLabel,
    calculatedDriveValueLabel, calculatedDriveValueLabelRed
}

public enum Color {
    case baseBlueColor, baseGreenColor, baseGrayColor, baseBlueDarkColor
}


class StyleKit {
    
    // swiftlint:disable cyclomatic_complexity
    
    static func attributedText(text: String, attribute: Attribute) -> NSAttributedString {
        var attributedDictionary = [String: AnyObject]()
        switch attribute {
        case .menuButton:
            attributedDictionary = attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 17 , weight: UIFontWeightLight))
        case .collectParameterLabel:
            attributedDictionary = attributedText(color: colorType(color: .baseGrayColor), font: UIFont.systemFont(ofSize: 17 , weight: UIFontWeightLight))
        case .collectStateLabel:
            attributedDictionary = attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 20 , weight: UIFontWeightLight))
        case .collectDriveItemData:
            attributedDictionary = attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 15 , weight: UIFontWeightLight), alignment: .center)
        case .collectDriveValueLabel:
            attributedDictionary = attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 13 , weight: UIFontWeightLight), alignment: .center)
        case .collectDriveItemHeader:
            attributedDictionary = attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 17 , weight: UIFontWeightRegular), alignment: .center)
        case .calculatedDriveValueLabel:
                attributedDictionary = attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 15 , weight: UIFontWeightRegular))
        case .calculatedDriveValueLabelRed:
            attributedDictionary = attributedText(color: UIColor.red, font: UIFont.systemFont(ofSize: 15 , weight: UIFontWeightRegular))
        }
        return NSAttributedString(string: text, attributes: attributedDictionary)
    }
    
    static func navBarAttributes() -> [String: Any] {
        return attributedText(color: UIColor.white, font: UIFont.systemFont(ofSize: 21, weight: UIFontWeightLight))
    }
    
    static func colorType(color: Color) -> UIColor {
        switch color {
        case .baseBlueColor:
            return UIColor(hexString: "#2D3D54")!
        case .baseBlueDarkColor:
            return UIColor(hexString: "#1C2E49")!
        case .baseGreenColor:
            return UIColor(hexString: "#5EC6B9")!
        case .baseGrayColor:
            return UIColor(hexString: "#AFB6C0")!
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
