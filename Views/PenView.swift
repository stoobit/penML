//
//  SwiftUIView.swift
//
//
//  Created by Till Brügmann on 11.06.24.
//

import SwiftUI

@available(iOS 17.0, *)
struct PenView: View {
    @Binding var pen: PenModel
    
    var action: ActionModel
    var active: ActionType
    var isRunning: Bool

    var body: some View {
        VStack {
            UnevenRoundedRectangle(cornerRadii: .init(
                topLeading: 20,
                bottomLeading: 5,
                bottomTrailing: 5,
                topTrailing: 20
            ))
            .foregroundStyle(
                pen.inGame ? .black : .secondary
            )
            .frame(height: 70)

            UnevenRoundedRectangle(cornerRadii: .init(
                topLeading: 5,
                bottomLeading: 20,
                bottomTrailing: 20,
                topTrailing: 5
            ))
            .foregroundStyle(
                pen.inGame ? pen.color : .secondary
            )
            .overlay {
                if active == .ai && isRunning && pen.color != .brown {
                    VStack {
                        ForEach(action.available, id: \.self) { int in
                            Text(String(int))
                                .frame(maxHeight: .infinity)
                                .font(.title2)
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .fontWidth(.expanded)
                        }
                    }
                    .padding(.vertical, 100)
                }
            }
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .offset(y: pen.inGame ? 0 : 400)
        .animation(.bouncy, value: pen.inGame)
    }
}
