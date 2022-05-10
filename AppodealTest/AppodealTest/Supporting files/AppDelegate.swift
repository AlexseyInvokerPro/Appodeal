//
//  AppDelegate.swift
//  AppodealTest
//
//  Created by Алексей Авдейчик on 10.05.22.
//

import UIKit
import Appodeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let types: AppodealAdType = [.banner, .rewardedVideo, .interstitial, .nativeAd]
        Appodeal.initialize(withApiKey: "3135b2cde254cd761b6dfc261a59c2c3", types: types)
       return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

