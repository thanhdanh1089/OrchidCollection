//
//  HouseGardenModelView.swift
//  Orchid
//
//  Created by Danh Truong on 3/19/21.
//

import Foundation
import Combine

final class HouseGardenModelView: ObservableObject {
    @Published var houseGardens: [HouseGarden] = WriteReadUtils.shared.loadJson("HouseGarden_Data.json")
    
//    var features: [OrchidVar] {
//        orchidVars.filter { $0.isFeatured }
//    }
    
    var categories: [String : [HouseGarden]] {
        Dictionary(
            grouping: houseGardens, by: {
                $0.category.rawValue
            }
        )
    }
}
