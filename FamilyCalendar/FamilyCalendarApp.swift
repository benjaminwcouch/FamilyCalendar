//
//  FamilyCalendarApp.swift
//  FamilyCalendar
//
//  Created by Benjamin Couch on 27/6/2024.
//
import SwiftUI
import Firebase

@main
struct FamilyCalendarApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
