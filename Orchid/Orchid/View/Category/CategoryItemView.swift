//
//  CategoryItemView.swift
//  Orchid
//
//  Created by Danh Truong on 3/16/21.
//

import SwiftUI

struct CategoryItemView: View {
    var orchid: OrchidVar
    
    var body: some View {
        NavigationLink(
            destination: DetailInfoView(orchid: orchid)) {
            HStack {
                orchid.image
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(orchid.name)
                Spacer()
//                if orchid.isFavorite {
//                    Image(systemName: "star.fill")
//                        .foregroundColor(.yellow)
//                }
            }
        }
        
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(orchid: CategoryModelView().orchidVars[0])
    }
}
