//
//  RotatedBadgeSymbolView.swift
//  Orchid
//
//  Created by Danh Truong on 3/18/21.
//

import SwiftUI

struct RotatedBadgeSymbolView: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbolView()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbolView(angle: Angle(degrees: 5))
    }
}
