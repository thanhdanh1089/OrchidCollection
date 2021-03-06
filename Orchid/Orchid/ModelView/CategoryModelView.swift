//
//  CategoryModelView.swift
//  Orchid
//
//  Created by Danh Truong on 3/16/21.
//

import Foundation
import Combine

final class CategoryModelView: ObservableObject {
//    @Published var landmarks: [LandMark] = WriteReadUtils.shared.loadJson("landmarkData.json")
    @Published var orchidVars: [OrchidVar] = WriteReadUtils.shared.loadJson("Orchid_Data.json")
    var hikes: [Hike] = WriteReadUtils.shared.loadJson("hikeData.json")
    
    var features: [OrchidVar] {
        orchidVars.filter { $0.isFeatured }
    }
    
    var categories: [String : [OrchidVar]] {
        Dictionary(
            grouping: orchidVars, by: {
                $0.category.rawValue
            }
        )
    }
}
