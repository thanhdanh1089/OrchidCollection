//
//  CategoryFeatureItemView.swift
//  Orchid
//
//  Created by Danh Truong on 3/16/21.
//

import SwiftUI

struct CategoryFeatureItemView: View {
    var orchid: OrchidVar
    
    var body: some View {
        VStack(alignment: .leading) {
            orchid.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5.0)
            Text(orchid.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryFeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFeatureItemView(orchid: CategoryModelView().orchidVars[0])
    }
}
