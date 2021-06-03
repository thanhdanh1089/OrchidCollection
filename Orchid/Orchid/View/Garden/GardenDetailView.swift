//
//  GardenDetailView.swift
//  Orchid
//
//  Created by Danh Truong on 3/19/21.
//

import SwiftUI

struct GardenDetailView: View {
    @EnvironmentObject var modelData: HouseGardenModelView
    var garden: HouseGarden
    var gardenIndex: Int {
        modelData.houseGardens.firstIndex(where: { $0.id == garden.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: garden.locationCoordinate)
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                garden.image
                    .resizable()
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                    .scaledToFill()
                CircleImageView(image: garden.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading, spacing: 0){
                    HStack {
                        Text(garden.name)
                            .font(.title)
                            .foregroundColor(.primary)
//                        FavoriteButtonView(isSet: $modelData.landmarks[orchidIndex].isFavorite)
                    }
                    Text(garden.category.rawValue)
//                    HStack {
//                        Text(landmark.park)
//                        Spacer()
//                        Text(landmark.city)
//                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text("\(TextConstant.InforLabel.rawValue): \(garden.name)")
                        .font(.title2)
                    Text(garden.description)
                }
                .padding()
            }
        }
        .navigationTitle(garden.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GardenDetailView_Previews: PreviewProvider {
    static let modelData = HouseGardenModelView()
    static var previews: some View {
        GardenDetailView(garden: HouseGardenModelView().houseGardens[0])
            .environmentObject(modelData)
    }
}
