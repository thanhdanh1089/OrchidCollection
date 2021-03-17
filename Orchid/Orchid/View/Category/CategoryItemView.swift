//
//  CategoryItemView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct CategoryItemView: View {
    var landmark: LandMark
    
    var body: some View {
        NavigationLink(
            destination: DetailInfoView(landmark: landmark)) {
            HStack {
                landmark.image
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(landmark.name)
                Spacer()
            }
        }
        
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(landmark: CategoryModelView().landmarks[0])
    }
}
