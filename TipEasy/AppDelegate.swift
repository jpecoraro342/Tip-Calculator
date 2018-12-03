//
//  AppDelegate.swift
//  TipEasy
//
//  Created by Joseph Pecoraro on 12/15/15.
//  Copyright © 2015 Joseph Pecoraro. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])
        return true;
    }
}

