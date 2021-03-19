//
//  GardenItemView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/19/21.
//

import SwiftUI

struct GardenItemView: View {
    var gaden: HouseGarden
    
    var body: some View {
        HStack {
            gaden.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5.0)
                .padding(10)
                .foregroundColor(.blue)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
            VStack(alignment: .leading) {
                Text(gaden.name)
                    .bold()
                    .font(.system(size: CGFloat(18.0)))
                HStack {
                    Image(systemName: "tag.fill")
                        .foregroundColor(gaden.rating > 4.0 ? .yellow : .gray)
                    Text(gaden.garden)
                        .bold()
                        .font(.system(size: CGFloat(11.0)))
                }
                HStack {
                    Image(systemName: "mappin")
                    Text("\(gaden.address) \(gaden.ward) \(gaden.district) \(gaden.city)")
                }
                .font(.system(size: CGFloat(11.0)))
                .foregroundColor(.gray)
                HStack {
                    Image(systemName: "phone")
                    Text(gaden.phone)
                }
                .font(.system(size: CGFloat(11.0)))
                .foregroundColor(.gray)
            }
            Spacer()
//                if orchid.isFavorite {
//                    Image(systemName: "star.fill")
//                        .foregroundColor(.yellow)
//                }
        }
    }
}

struct GardenItemView_Previews: PreviewProvider {
    static var previews: some View {
        GardenItemView(gaden: HouseGardenModelView().houseGardens[0])
    }
}
