//
//  CategoryFeatureItemView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct CategoryFeatureItemView: View {
    var landmark: LandMark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5.0)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryFeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFeatureItemView(landmark: CategoryModelView().landmarks[0])
    }
}
