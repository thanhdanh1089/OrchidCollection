//
//  HouseGarden.swift
//  Orchid
//
//  Created by Danh Truong on 3/19/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct HouseGarden: Hashable, Codable, Identifiable {
    var name: String
    var garden: String
    var city: String
    var district: String
    var ward: String
    var address: String
    var id: Int
    var isFavorite: Bool
    var description: String
    var phone: String
    var facebook: String
    var rating: Double
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Big"
        case rivers = "Small"
        case mountains = "Medium"
    }
    private var imageName: String
    var image: Image {
        if imageName == "" {
            return Image(systemName: "person")
        }
        return Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude , longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
