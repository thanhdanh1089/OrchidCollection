//
//  HomeView.swift
//  Orchid
//
//  Created by Danh Truong on 3/11/21.
//

import SwiftUI

struct HomeView: View {
    @State private var selection: Tab = .featured
    @State private var dataModel = OrchidModelView()
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
//        TabView(selection: $selection) {
//            CategoryFeatureListView()
//                .tabItem {
//                    Label(
//                        TextConstant.HomeLabel.rawValue,
//                        systemImage: "house")
//                        .foregroundColor(.gray)
//                }
//                .tag(Tab.featured)
//            GardenListView()
//                .environmentObject(HouseGardenModelView())
//                .tabItem {
//                    Label(
//                        TextConstant.GardeningHouseLabel.rawValue,
//                        systemImage: "person.3")
//                }
//                .tag(Tab.list)
//        }
        List(dataModel.orchidModel) { orchids in
//                NavigationLink(destination: QuestionView(question: question)) {
//                    Details(question: question)
//                }
        }
        .navigationTitle("Top Questions")
        .onAppear {
            dataModel.fetchOrchid()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(CategoryModelView())
    }
}
