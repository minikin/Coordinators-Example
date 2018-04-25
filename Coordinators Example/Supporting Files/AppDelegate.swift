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
  private var applicationCoordinator: AppCoordinator?

  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    setUpAppCoordinator()
    return true
  }

  // MARK: - Helpers

  private func setUpAppCoordinator() {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let applicationCoordinator = AppCoordinator(window: window)
    self.window = window
    self.applicationCoordinator = applicationCoordinator
    applicationCoordinator.start()
  }
}
