//
//  HomeView.swift
//  Orchid
//
//  Created by Danh Truong on 3/11/21.
//

import SwiftUI

struct HomeView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryFeatureListView()
                .tabItem {
                    Label(
                        TextConstant.HomeLabel.rawValue,
                        systemImage: "house")
                        .foregroundColor(.gray)
                }
                .tag(Tab.featured)
            GardenListView()
                .tabItem {
                    Label(
                        TextConstant.GardeningHouseLabel.rawValue,
                        systemImage: "person.3")
                }
                .tag(Tab.list)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(CategoryModelView())
    }
}
