//
//  CategoryModelView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import Foundation
import Combine

final class CategoryModelView: ObservableObject {
    @Published var landmarks: [LandMark] = WriteReadUtils.shared.loadJson("landmarkData.json")
//    var hike: [Hike] = WriteReadUtils.shared.loadJson("hikeData.json")
    
    var features: [LandMark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String : [LandMark]] {
        Dictionary(
            grouping: landmarks, by: {
                $0.category.rawValue
            }
        )
    }
}
