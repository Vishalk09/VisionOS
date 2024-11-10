//
//  VisionOS360VideoDemoApp.swift
//  VisionOS360VideoDemo
//
//  Created by Vishal Khokad on 29/09/24.
//

import SwiftUI

@main
struct VisionOS360VideoDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        ImmersiveSpace {
            ContentView()
        }
    }
}
