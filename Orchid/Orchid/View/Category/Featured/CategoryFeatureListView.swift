//
//  CategoryFeatureListView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct CategoryFeatureListView: View {
    @EnvironmentObject var model: CategoryModelView
    
    var body: some View {
        NavigationView {
            List {
                model.features[0].image
                    .resizable()
                    .frame(height: 200)
                    .clipped()
                    .scaledToFill()
                    .listRowInsets(EdgeInsets())
                ForEach(model.categories.keys.sorted(), id: \.self) { key in
                    CategoryFeatureRowView(categoryName: key, items: model.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CategoryFeatureListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFeatureListView().environmentObject(CategoryModelView())
    }
}
