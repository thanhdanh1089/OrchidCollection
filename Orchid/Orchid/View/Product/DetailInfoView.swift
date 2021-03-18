//
//  DetailInfoView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct DetailInfoView: View {
    @EnvironmentObject var modelData: CategoryModelView
    var orchid: OrchidVar
    var orchidIndex: Int {
        modelData.orchidVars.firstIndex(where: { $0.id == orchid.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
//                MapView(coordinate: landmark.locationCoordinate)
//                    .frame(height: 300)
//                    .ignoresSafeArea(edges: .top)
                orchid.image
                    .resizable()
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                    .scaledToFill()
                CircleImageView(image: orchid.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading, spacing: 0){
                    HStack {
                        Text(orchid.name)
                            .font(.title)
                            .foregroundColor(.primary)
//                        FavoriteButtonView(isSet: $modelData.landmarks[orchidIndex].isFavorite)
                    }
                    Text(orchid.category.rawValue)
//                    HStack {
//                        Text(landmark.park)
//                        Spacer()
//                        Text(landmark.city)
//                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text("\(TextConstant.InforLabel.rawValue): \(orchid.name)")
                        .font(.title2)
                    Text(orchid.description)
                }
                .padding()
            }
        }
        .navigationTitle(orchid.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailInfoView_Previews: PreviewProvider {
    static let modelData = CategoryModelView()
    
    static var previews: some View {
        DetailInfoView(orchid: CategoryModelView().orchidVars[0])
            .environmentObject(modelData)
    }
}
