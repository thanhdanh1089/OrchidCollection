//
//  OrchidResource.swift
//  Orchid
//
//  Created by Danh Truong on 8/2/21.
//

import Foundation

// MARK: - OrchidResource
struct OrchidResource: APIResource {
    typealias ModelType = [OrchidModel]
    var id: Int?

    var methodPath: String {
        guard let id = id else {
            return "/phi-diep-5-canh-trangs"
        }
        return "/questions/\(id)"
    }

    var filter: String? {
        id != nil ? "!9_bDDxJY5" : nil
    }
}
