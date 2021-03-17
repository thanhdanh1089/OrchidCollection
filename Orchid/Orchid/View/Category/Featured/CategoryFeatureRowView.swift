//
//  CategoryFeatureRowView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct CategoryFeatureRowView: View {
    var categoryName: String
    var items: [OrchidVar]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(items) { orchid in
                        NavigationLink(destination: DetailInfoView(orchid: orchid)) {
                            CategoryFeatureItemView(orchid: orchid)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryFeatureRowView_Previews: PreviewProvider {
    static var landmarks = CategoryModelView().orchidVars
    
    static var previews: some View {
        CategoryFeatureRowView(categoryName: landmarks[0].category.rawValue,
                     items: Array(landmarks.prefix(4)))
    }
}
