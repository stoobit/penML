//
//  GameView.swift
//  penML
//
//  Created by Till Brügmann on 11.06.24.
//

import SwiftUI


struct GameView: View {
    @State var game: GameModel = GameModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("\(game.iterations)\(Text(" Iterations").font(.body))")
                    .font(.largeTitle.bold())
                    .foregroundStyle(
                        Color.accentColor
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                
                if game.isRunning {
                    Text("\(game.turn)'s\(Text(" turn.").font(.body))")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity)
                } else {
                    Text("Play again.")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity)
                }
                
                Text("\(Text("AI ").font(.body))\(game.aiScore) : \(game.playerScore)\(Text(" Player").font(.body))")
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
                if game.isRunning {
                    if game.active == .player {
                        Button("1") {
                            game.player(amount: 1)
                        }
                        
                        Button("2") {
                            game.player(amount: 2)
                        }
                        
                        
                        Button("3") {
                            game.player(amount: 3)
                        }
                    } else {
                        Button("Run") {
                            game.ai()
                        }
                    }
                } else {
                    Button("", systemImage: "arrow.circlepath") {
                        game.reset()
                    }
                    .labelStyle(.iconOnly)
                }
            }
            .animation(
                .bouncy, value: game.isRunning
            )
            .animation(
                .bouncy, value: game.active
            )
            .transition(.blurReplace)
            .buttonStyle(
                ActionButtonStyle()
            )
            .padding(30)
            
            HStack {
                ForEach(0..<10, id: \.self) { index in
                    PenView(
                        pen: $game.pens[index],
                        action: game.actions[index],
                        active: game.active,
                        isRunning: game.isRunning
                    )
                }
            }
            .padding(.horizontal, 50)
        }
    }
}
