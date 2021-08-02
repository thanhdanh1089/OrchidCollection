//
//  OrchidResource.swift
//  Orchid
//
//  Created by Shinhan DS on 8/2/21.
//

import Foundation

// MARK: - QuestionsResource
struct OrchidResource: APIResource {
    typealias ModelType = OrchidVar
    var id: Int?

    var methodPath: String {
        guard let id = id else {
            return "/questions"
        }
        return "/questions/\(id)"
    }

    var filter: String? {
        id != nil ? "!9_bDDxJY5" : nil
    }
}
