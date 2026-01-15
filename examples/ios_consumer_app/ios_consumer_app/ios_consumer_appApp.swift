//
//  ios_consumer_appApp.swift
//  ios_consumer_app
//
//  Created by David Castaño on 15/01/26.
//

import SwiftUI
import Flutter
import FlutterPluginRegistrant
// WARNING: You must add the "FlutterIntegration" Package Dependency for this to compile!
import FlutterIntegration

@main
struct ios_consumer_appApp: App {
    @StateObject var flutterDependencies = FlutterDependencies()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flutterDependencies)
        }
    }
}

class FlutterDependencies: ObservableObject {
    let flutterEngine = FlutterEngine(name: "my flutter engine")

    init() {
        // Run the engine
        flutterEngine.run()
        // Connect plugins
        GeneratedPluginRegistrant.register(with: flutterEngine)
    }
}
