//
//  ContentView.swift
//  WindowSizes
//
//  Created by Erik Loehfelm on 8/2/24.
//

import SwiftUI
import RealityKit
import RealityKitContent



struct ContentView: View {
    var windohGroups: [WindohGroup]
    @ObservedObject var selectedWindoh: SelectedWindoh
    
    @State private var selectedWindohGroup: WindohGroup?
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.pushWindow) private var pushWindow
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedWindohGroup) {
                ForEach(windohGroups) { windohGroup in
                    NavigationLink(value: windohGroup) {
                        Label(windohGroup.name, systemImage: "pencil")
                    }
                }
            }
            .navigationTitle("Groups")
        } detail: {
            if let s = selectedWindohGroup {
                List {
                    ForEach(s.windohs) { windoh in
                        Button {
                            selectedWindoh.windoh = windoh
                            pushWindow(id: "pushedWindow")
                            
                            print("windoh: \(selectedWindoh.windoh)")
                        } label: {
                            HStack {
                                Text(windoh.name)
                            }
                        }
                    }
                }
                .navigationTitle("Sizes")
            } else {
                Text("Select a window group")
            }
        }
    }
}

//#Preview(windowStyle: .automatic) {
//    ContentView()
//}
