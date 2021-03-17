//
//  DetailInfoView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI

struct DetailInfoView: View {
    @EnvironmentObject var modelData: CategoryModelView
    var landmark: LandMark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                CircleImageView(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading, spacing: 0){
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                            .foregroundColor(.primary)
                        FavoriteButtonView(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    Text(landmark.name)
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.city)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailInfoView_Previews: PreviewProvider {
    static let modelData = CategoryModelView()
    
    static var previews: some View {
        DetailInfoView(landmark: CategoryModelView().landmarks[0])
            .environmentObject(modelData)
    }
}
