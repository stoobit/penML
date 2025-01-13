//
//  File.swift
//  penML
//
//  Created by Till Brügmann on 13.01.25.
//

import Foundation

@Observable class GameModel {
    var isRunning: Bool = true

    var active: ActionType = .ai
    var index: Int = 0

    var playerScore: Int = 0
    var aiScore: Int = 0

    var iterations: Int = 0

    var recentPen: Int = 0
    var recentValue: Int = 0
    
    var turn: String {
        return active == .ai ? "AI" : "Player"
    }
    
    var activePens: [PenModel] {
        return pens.filter { $0.inGame }
    }

    var pens: [PenModel] = [
        PenModel(color: .red),
        PenModel(color: .orange),
        PenModel(color: .yellow),
        PenModel(color: .green),
        PenModel(color: .mint),
        PenModel(color: .cyan),
        PenModel(color: .blue),
        PenModel(color: .purple),
        PenModel(color: .pink),
        PenModel(color: .brown),
    ]
    
    var actions: [ActionModel] =
        Array(repeating: ActionModel(), count: 10)
    
    func ai() {
        guard let random = actions[index]
            .available.randomElement()
        else {
            return
        }

        for position in index ... random + index {
            if pens.indices.contains(position - 1) {
                pens[position - 1].inGame = false
            }
        }
        
        recentPen = index
        recentValue = random
        
        print("did", recentPen, recentValue)
        
        index += random
        active = .player
        
        if activePens.count == 1 {
            iterations += 1
            aiScore += 1
            isRunning = false
        } else if activePens.count == 0 {
            iterations += 1
            playerScore += 1
            isRunning = false
            
            learn()
        }
    }
    
    func player(amount: Int) {
        for position in index ... amount + index {
            if pens.indices.contains(position - 1) {
                pens[position - 1].inGame = false
            }
        }

        index += amount
        active = .ai
        
        if activePens.count == 1 {
            iterations += 1
            playerScore += 1
            isRunning = false
            
            learn()
        }
        
        if actions.indices.contains(index) {
            if actions[index].available.isEmpty {
                iterations += 1
                playerScore += 1
                isRunning = false
                
                learn()
            }
        } else {
            iterations += 1
            aiScore += 1
            isRunning = false
        }
    }
    
    func learn() {
        actions[recentPen].available
            .removeAll(where: { $0 == recentValue })
        
        print("rmv", recentPen, recentValue)
    }
    
    func reset() {
        isRunning = true
        index = 0
        active = .ai
        
        for index in 0 ... pens.count - 1 {
            pens[index].inGame = true
        }
    }
}
