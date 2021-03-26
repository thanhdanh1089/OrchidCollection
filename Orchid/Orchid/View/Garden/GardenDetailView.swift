//
//  GardenDetailView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/19/21.
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
//                garden.image
//                    .resizable()
//                    .frame(height: 300)
//                    .ignoresSafeArea(edges: .top)
//                    .scaledToFill()
//                CircleImageView(image: garden.image)
//                    .offset(y: -130)
//                    .padding(.bottom, -130)
//                    .frame(width: 150, height: 300)
                VStack(alignment: .leading, spacing: 0){
                    HStack {
                        garden.image
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(.gray)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        Text(garden.name)
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.green)
                                .frame(width: 20, height: 20, alignment: .leading)
                            Text(garden.garden)
                        }
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.black)
                                .frame(width: 20, height: 20, alignment: .leading)
                            Text(garden.phone)
                        }
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.red)
                                .frame(width: 20, height: 20, alignment: .leading)
                            Text("\(garden.address) \(garden.ward) \(garden.district) \(garden.city)" )
                        }
                        HStack {
                            Image("fb")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20, alignment: .leading)
                            Text(garden.facebook)
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Spacer()
                    Divider()
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Image(systemName: "info.circle.fill")
                            Text("\(TextConstant.InforLabel.rawValue)")
                                .font(.title2)
                        }
                        Text(garden.description)
                    }
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedCorner(radius: 20.0, corners: .topLeft))
                .clipShape(RoundedCorner(radius: 20.0, corners: .topRight))
            }
            .background(Color.gray)
        }
        .navigationTitle(garden.garden)
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
