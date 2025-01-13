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
        TabView
        
        GameView()
    }
}

#Preview {
    ContentView()
}
