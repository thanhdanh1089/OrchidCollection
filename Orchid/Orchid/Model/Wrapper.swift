//
//  Wrapper.swift
//  Orchid
//
//  Created by Danh Truong on 8/2/21.
//

import Foundation

// MARK: - Wrapper
struct Wrapper<T: Decodable>: Decodable {
    let items: [T]
}
