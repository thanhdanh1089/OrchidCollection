//
//  GardenListView.swift
//  Orchid
//
//  Created by Danh Truong on 3/19/21.
//

import SwiftUI

struct GardenListView: View {
    @EnvironmentObject var model: HouseGardenModelView
    @State private var showFavoritesOnly = false
    
    var filteredGarden: [HouseGarden] {
        model.houseGardens.filter { garden in
            (!showFavoritesOnly)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorite Only")
                })
                
                ForEach(filteredGarden, id: \.self) { garden in
                    NavigationLink(destination:
                                    GardenDetailView(garden: garden)) {
                        GardenItemView(gaden: garden)
                    }
                    
                }
            }
            .navigationTitle(TextConstant.GardeningHouseScreenTitle.rawValue)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GardenListView_Previews: PreviewProvider {
    static var previews: some View {
        GardenListView().environmentObject(HouseGardenModelView())
    }
}
