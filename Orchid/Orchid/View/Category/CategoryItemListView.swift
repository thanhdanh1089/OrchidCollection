//
//  CategoryItemListView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct CategoryItemListView: View {
    @EnvironmentObject var model: CategoryModelView
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.landmarks, id: \.self) { landmark in
                    CategoryItemView(landmark: landmark)
                }
            }
            .navigationTitle("List")
        }
    }
}

struct CategoryItemListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemListView().environmentObject(CategoryModelView())
    }
}
