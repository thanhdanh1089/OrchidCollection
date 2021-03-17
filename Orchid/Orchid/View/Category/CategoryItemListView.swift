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
    var filteredOrchid: [OrchidVar] {
        model.orchidVars.filter { orchid in
            (!showFavoritesOnly)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorite Only")
                })
                ForEach(filteredOrchid, id: \.self) { orchid in
                    CategoryItemView(orchid: orchid)
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
