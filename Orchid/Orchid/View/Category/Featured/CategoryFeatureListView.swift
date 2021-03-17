//
//  CategoryFeatureListView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct CategoryFeatureListView: View {
    @EnvironmentObject var model: CategoryModelView
    @State var count = 0
    
    var body: some View {
        NavigationView {
            List {
                bloomsCatalog
                ForEach(model.categories.keys.sorted(), id: \.self) { key in
                    CategoryFeatureRowView(categoryName: key, items: model.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var bloomsCatalog: some View {
        VStack(alignment: .leading) {
            Text("Album")
                .font(.headline)
                .padding(.top, 5)
            ZStack {
                ForEach(model.orchidVars.indices) { index in
                    bloomCard(item: model.orchidVars[index])
                        .offset(x: index >= model.orchidVars.count - count ? -250 : 0, y: CGFloat(index * -1/2))
                        .rotation3DEffect(Angle(degrees: index >= model.orchidVars.count - count ? 10: 0), axis: (x: 0, y: 10, z: 20))
                        .animation(Animation.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0).delay(0.1))
                        .gesture(
                            DragGesture()
                                .onChanged { _ in }
                                .onEnded { dragGesture in
                                    count = dragGesture.startLocation.x - dragGesture.predictedEndLocation.x < 0 ? count - 1 : count + 1
                                }
                        )
                }.padding(20)
            }
        }
    }
    
    private func bloomCard(item: OrchidVar) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
            VStack(spacing: 20) {
                item.image
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                
                Text(item.name)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(Color.orange)
                    .padding(.bottom, 20)
            }
        }.padding(.horizontal, 30)
    }
}

struct CategoryFeatureListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFeatureListView().environmentObject(CategoryModelView())
    }
}
