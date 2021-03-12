//
//  LandMark.swift
//  Orchid
//
//  Created by Shinhan DS on 3/12/21.
//

import Foundation

struct LandMark: Codable {
    var name: String
    var category: String
    var city: String
    var state: String
    var id: Int
    var isFeatured: Bool
    var isFavorite: Bool
    var park: String
    var description: String
    var imageName: String
    var coordinates: Range<Double>
}
