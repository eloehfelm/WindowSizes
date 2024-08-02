//
//  WindowSizesApp.swift
//  WindowSizes
//
//  Created by Erik Loehfelm on 8/2/24.
//

import SwiftUI

@main
struct WindowSizesApp: App {
    
    @State private var WindohGroups = [
        WindohGroup(name: "Phones", windohs: [
            Windoh(name: "iPhone 15", w: 1400, h: 400),
            Windoh(name: "iPhone 8", w: 640, h: 640)]),
        WindohGroup(name: "iPads", windohs: [
            Windoh(name: "iPad Pro", w: 2400, h: 800)
        ])
    ]
    
    @StateObject var selectedWindoh = SelectedWindoh()
    
    var body: some Scene {
        WindowGroup {
            ContentView(windohGroups: WindohGroups, selectedWindoh: selectedWindoh)
        }
        
        WindowGroup(id: "pushedWindow") {
            PushedWindow(selectedWindoh: selectedWindoh)
                .frame(width: selectedWindoh.windoh.w, height: selectedWindoh.windoh.h)
        }
        .windowResizability(.contentSize)
    }
}

struct Windoh: Identifiable, Hashable {
    var id: UUID { UUID() }
    var name: String
    var w: CGFloat
    var h: CGFloat
}

struct WindohGroup: Identifiable, Hashable {
    var id: UUID { UUID() }
    var name: String
    var windohs: [Windoh]
}

class SelectedWindoh: ObservableObject {
    @Published var windoh = Windoh(name: "Base", w: 1024, h: 768)
}
