//
//  ContentView.swift
//  penML
//
//  Created by Till Brügmann on 11.06.24.
//

import SwiftUI

@available(iOS 17.0, *)
extension ContentView {
    var body: some View {
        VStack {
            HStack {
                Text("\(iterations)\(Text(" Iterations").font(.body))")
                    .font(.largeTitle.bold())
                    .foregroundStyle(
                        Color.accentColor
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                
                if isRunning {
                    Text("\(turn)'s\(Text(" turn.").font(.body))")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity)
                } else {
                    Text("Play again.")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity)
                }
                
                Text("\(Text("AI ").font(.body))\(aiScore) : \(playerScore)\(Text(" Player").font(.body))")
                    .font(.largeTitle.bold())
                    .foregroundStyle(
                        Color.accentColor
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .trailing
                    )
            }
            .padding(.top, 10)
            .padding(.horizontal, 30)
            
            HStack(spacing: 20) {
                if isRunning {
                    if active == .player {
                        Button("1") {
                            player(amount: 1)
                        }
                        
                        Button("2") {
                            player(amount: 2)
                        }
                        
                        Button("3") {
                            player(amount: 3)
                        }
                    } else {
                        Button("Run") {
                            ai()
                        }
                    }
                } else {
                    Button("", systemImage: "arrow.circlepath") {
                        reset()
                    }
                    .labelStyle(.iconOnly)
                }
            }
            .animation(
                .bouncy, value: isRunning
            )
            .animation(
                .bouncy, value: active
            )
            .transition(.blurReplace)
            .buttonStyle(
                ActionButtonStyle()
            )
            .padding(30)
            
            HStack {
                ForEach(0 ..< 10) { index in
                    PenView(
                        pen: $pens[index],
                        action: actions[index],
                        active: active,
                        isRunning: isRunning
                    )
                }
            }
            .padding(.horizontal, 50)
        }
    }
}
