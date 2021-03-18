//
//  BadgeView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/18/21.
//

import SwiftUI

struct BadgeView: View {
    static let rotationCount = 8
    var badgeSymbols: some View {
        ForEach(0..<BadgeView.rotationCount) { i in
            RotatedBadgeSymbolView(
                angle: .degrees(Double(i) / Double(BadgeView.rotationCount)) * 360.0
            ).opacity(0.5)
        }
    }
    var body: some View {
        ZStack {
            BadgeBackgroundView()
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }.scaledToFit()
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
