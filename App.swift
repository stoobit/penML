import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        // MARK: The app is intended for use in fullscreen mode only.
        
        WindowGroup {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                
                if width < height {
                    UnavailabelView()
                } else {
                    ContentView()
                }
            }
        }
    }
}
