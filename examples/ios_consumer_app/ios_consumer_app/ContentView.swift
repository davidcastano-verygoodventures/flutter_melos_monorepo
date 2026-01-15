//
//  ContentView.swift
//  ios_consumer_app
//
//  Created by David Castaño on 15/01/26.
//

import SwiftUI
import Flutter

struct ContentView: View {
    @EnvironmentObject var flutterDependencies: FlutterDependencies

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Native iOS View")
                .font(.headline)
            
            Spacer().frame(height: 20)
            
            Button("Launch Flutter Module") {
                showFlutter()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
    
    func showFlutter() {
        // Get the Root View Controller
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }

        // Create the FlutterViewController with the pre-warmed engine
        let flutterViewController = FlutterViewController(
            engine: flutterDependencies.flutterEngine,
            nibName: nil,
            bundle: nil
        )
        
        // Present it
        rootViewController.present(flutterViewController, animated: true, completion: nil)
    }
}

#Preview {
    ContentView()
}
