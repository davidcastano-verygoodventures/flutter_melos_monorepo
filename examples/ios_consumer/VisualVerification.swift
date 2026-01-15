import SwiftUI
import Flutter
import FlutterPluginRegistrant

// 1. The Flutter Dependency
// Ensure you have added the "FlutterIntegration" Package Dependency in Xcode.
import FlutterIntegration

@main
struct IOSConsumerApp: App {
    // Create the FlutterEngine
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

struct ContentView: View {
    @EnvironmentObject var flutterDependencies: FlutterDependencies

    var body: some View {
        VStack {
            Text("Native iOS View")
                .padding()
            
            Button("Launch Flutter Module") {
                showFlutter()
            }
        }
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
