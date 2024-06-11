//
//  PenModel.swift
//
//
//  Created by Till Brügmann on 11.06.24.
//

import Foundation
import SwiftUI

struct PenModel: Identifiable, Hashable {
    let id = UUID()

    var color: Color
    var inGame: Bool = true
}
