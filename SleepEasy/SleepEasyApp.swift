//
//  SleepEasyApp.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//


import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct SleepEasyApp: App {
    // register app delegate for Firebase setup
    @StateObject var audioManager = AudioManager()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                .environmentObject(audioManager)
        }
    }
}
