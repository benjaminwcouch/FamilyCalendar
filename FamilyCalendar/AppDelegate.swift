//
//  AppDelegate.swift
//  FamilyCalendar
//
//  Created by Benjamin Couch on 27/6/2024.
//

import UIKit
import Firebase


class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
