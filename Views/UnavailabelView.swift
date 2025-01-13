//
//  UnavailabelView.swift
//  penML
//
//  Created by Till Brügmann on 13.01.25.
//

import SwiftUI

struct UnavailabelView: View {
    var body: some View {
        ContentUnavailableView(
            "You're in Portrait Mode",
            systemImage: "ipad.gen2.landscape",
            description: Text("Please switch to landscape mode to use this app.")
        )
    }
}

