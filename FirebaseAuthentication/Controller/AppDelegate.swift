//
//  AppDelegate.swift
//  FirebaseAuthentication
//
//  Created by Admin on 08/03/22.
//

import UIKit
import Firebase

@main


class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }


}

