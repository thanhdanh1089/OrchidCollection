//
//  UIFontExtension.swift
//  Orchid
//
//  Created by ThaoHuynh on 6/7/21.
//

import Foundation
import SwiftUI

extension UIFont {
    func toCTFont() -> CTFont {
        return CTFontCreateWithName(fontName as CFString, pointSize as CGFloat, nil)
    }
    
    func toSwiftUIFont() -> SwiftUI.Font {
        return SwiftUI.Font(toCTFont())
    }
}

