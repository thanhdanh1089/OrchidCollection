//
//  OrchidVar.swift
//  Orchid
//
//  Created by Thao Huynh on 3/17/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct OrchidVar: Hashable, Codable, Identifiable {
    var name: String
    var id: Int
    var isFeatured: Bool
    var description: String
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case whiteWingsOrchidVar = "5 cánh trắng"
        case pinkOrchidVar = "phi điệp hồng"
        case fullColorOrchid = "phi điệp bệt"
        case nearingWhiteWingOrchid = "phi điệp ám"
    }
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
