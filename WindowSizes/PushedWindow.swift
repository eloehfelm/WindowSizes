//
//  PushedWindow.swift
//  WindowSizes
//
//  Created by Erik Loehfelm on 8/2/24.
//

import SwiftUI

struct PushedWindow: View {
    @ObservedObject var selectedWindoh: SelectedWindoh
    
    var body: some View {
        Text("Hello, \(selectedWindoh.windoh.name)")
    }
}

//#Preview {
//    PushedWindow()
//}
