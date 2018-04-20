//
//  AppDelegate.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 18.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var coordinator: AppCoordinator?

  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nav = storyboard.instantiateInitialViewController() as! UINavigationController
    window?.rootViewController = nav

    coordinator = AppCoordinator(navigationController: nav)
    coordinator?.start()

    window?.makeKeyAndVisible()

    return true
  }
}
