//
//  TextStylesView.swift
//  Orchid
//
//  Created by ThaoHuynh on 6/7/21.
//

import SwiftUI

extension Text {
    init(_ text: String, color: Color, font: UIFont) {
        self.init(LocalizedStringKey(text))
        self = self.font(font.toSwiftUIFont())
        self = self.foregroundColor(color)
    }
    
    func adjustFontToFitWidth(factor: CGFloat = 0.6) -> some View {
        self.allowsTightening(true).minimumScaleFactor(factor)
    }
    
    func multiline(centered: Bool = false) -> some View {
        self.multilineTextAlignment(centered ? .center : .leading).lineLimit(nil).fixedSize(horizontal: false, vertical: true)
    }
}
