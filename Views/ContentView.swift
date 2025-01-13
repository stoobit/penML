//
//  ContentView.swift
//  penML
//
//  Created by Till Brügmann on 13.01.25.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 0
    
    var body: some View {
        TabView {
            Text("page on")
                .tag(0)
            
            GameView()
                .tag(1)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .scrollDisabled(true)
    }
}

#Preview {
    ContentView()
}
