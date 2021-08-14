//
//  OrchidModel.swift
//  Orchid
//
//  Created by Thao Huynh on 8/3/21.
//

import SwiftUI
import CoreLocation

struct OrchidModel: Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
//    var publisheDate: Date
//    var createdAt: String
//    var updatedAt: String
//    var overview: String
    var images: [ImageModel]
}

struct ImageModel: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var caption: String
    var width: Double
    var height: Double
    var url: String
    var created_at: String
    var updated_at: String
}

