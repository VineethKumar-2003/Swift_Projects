//
//  Swift_AlertApp.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 16/02/25.
//

import SwiftUI
import SwiftData
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
        }
}

@main
struct Swift_AlertApp: App {
    // register app delegate for Firebase Setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var isLoggedIn = Auth.auth().currentUser != nil
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainScreen()
            } else {
                SplashView(isLoggedIn: $isLoggedIn)
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
