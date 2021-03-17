//
//  CategoryItemListView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct CategoryItemListView: View {
    @EnvironmentObject var model: CategoryModelView
    @State private var showFavoritesOnly = false
    var filteredLandmarks: [LandMark] {
        model.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorite Only")
                })
                ForEach(filteredLandmarks, id: \.self) { landmark in
                    CategoryItemView(landmark: landmark)
                }
            }
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CategoryItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            CategoryItemListView().environmentObject(CategoryModelView())
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
