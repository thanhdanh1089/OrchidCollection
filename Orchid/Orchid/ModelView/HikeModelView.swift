//
//  HikeModelView.swift
//  Orchid
//
//  Created by Danh Truong on 3/12/21.
//

import Foundation
import Combine

final class HikeModelView: ObservableObject {
    @Published var landMark: [LandMark] = WriteReadUtils.shared.loadJson("landmark.json")
    var hikes: [Hike] = WriteReadUtils.shared.loadJson("hikeData.json")
}
