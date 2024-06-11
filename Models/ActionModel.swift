//
//  File.swift
//
//
//  Created by Till Brügmann on 11.06.24.
//

import Foundation

struct ActionModel: Identifiable, Hashable {
    let id = UUID()
    var available: [Int] = [1, 2, 3]
}
