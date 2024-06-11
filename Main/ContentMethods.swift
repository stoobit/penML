//
//  ContentMethods.swift
//  penML
//
//  Created by Till Brügmann on 11.06.24.
//

import SwiftUI

@available(iOS 17.0, *)
extension ContentView {
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
        
        if actions[index].available.isEmpty {
            iterations += 1
            playerScore += 1
            isRunning = false
            
            learn()
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
