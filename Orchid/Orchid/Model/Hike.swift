//
//  Hike.swift
//  Orchid
//
//  Created by Shinhan DS on 3/12/21.
//

import Foundation

class Hike: Codable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observations]
    
    static var formater = LengthFormatter()
    
    var distanceText: String {
        return Hike.formater.string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observations: Codable {
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        var distanceFromStart: Range<Double>
    }
    
}
