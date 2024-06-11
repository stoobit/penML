import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    @State var isRunning: Bool = true
    
    @State var active: ActionType = .ai
    @State var index: Int = 0
    
    @State var playerScore: Int = 0
    @State var aiScore: Int = 0
    
    @State var iterations: Int = 0
    
    @State var recentPen: Int = 0
    @State var recentValue: Int = 0
    
    var turn: String {
        return active == .ai ? "AI" : "Player"
    }
    
    var activePens: [PenModel] {
        return pens.filter { $0.inGame }
    }

    @State var pens: [PenModel] = [
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
    
    @State var actions: [ActionModel] =
        Array(repeating: ActionModel(), count: 10)
}
