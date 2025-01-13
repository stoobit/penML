//
//  SwiftUIView.swift
//
//
//  Created by Till Brügmann on 11.06.24.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .foregroundColor(
                configuration.isPressed ? .secondary : .accentColor
            )
            .fontWidth(.expanded)
            .fontWeight(.semibold)
            .frame(width: 100)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.ultraThickMaterial)
            }
    }
}
