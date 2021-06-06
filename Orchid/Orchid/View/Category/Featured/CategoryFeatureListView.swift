//
//  CategoryFeatureListView.swift
//  Orchid
//
//  Created by Danh Truong on 3/16/21.
//

import SwiftUI

struct CategoryFeatureListView: View {
    @EnvironmentObject var model: CategoryModelView
    @State var count = 0
    @State var bloomCardSize: CGFloat = 150
    
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
            Text("Một số mặt hoa nổi bật")
                .font(.subheadline)
                .padding(.top, 5)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(model.orchidVars.indices) { index in
                        bloomCard(item: model.orchidVars[index])
                            .animation(Animation.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0).delay(0.1))
                            .gesture(
                                DragGesture()
                                    .onChanged { _ in }
                                    .onEnded { dragGesture in
                                        count = dragGesture.startLocation.x - dragGesture.predictedEndLocation.x < 0 ? count - 1 : count + 1
                                    }
                            )
                            .zIndex(index <= model.orchidVars.count - count ? Double(index) : Double(count))
                    }
                }
            }
        }
    }
    
    private func bloomCard(item: OrchidVar) -> some View {
        VStack {
            item.image
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: bloomCardSize, height: bloomCardSize)
                .cornerRadius(150)
            Text(item.name)
                .font(.system(size: 14, weight: .bold, design: .default))
                .foregroundColor(Color.orange)
                .padding(.top, 16)
        }.padding(15)
    }
}

struct CategoryFeatureListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFeatureListView().environmentObject(CategoryModelView())
    }
}
