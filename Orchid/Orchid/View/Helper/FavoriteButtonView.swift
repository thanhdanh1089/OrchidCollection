//
//  FavoriteButtonView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/17/21.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Binding var isSet: Bool
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor( isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(isSet: .constant(true))
    }
}
