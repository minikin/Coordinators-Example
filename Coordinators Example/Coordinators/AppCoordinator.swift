//
//  AppCoordinator.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 24.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

/// The AppCoordinator is our main coordinator
/// In this example the AppCoordinator as a rootViewController
final class AppCoordinator: RootCoordinator {

  // MARK: - Properties

  private let window: UIWindow

  private lazy var navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.isNavigationBarHidden = true
    return navigationController
  }()

  var childCoordinators: [Coordinator] = []

  var rootViewController: UIViewController {
    return navigationController
  }

  // MARK: - Initialisation

  init(window: UIWindow) {
    self.window = window
    self.window.rootViewController = navigationController
    self.window.makeKeyAndVisible()
  }

  /// Starts the coordinator
  func start() {
    let defaults = UserDefaults.standard
    let userStatus = defaults.bool(forKey: "UserLoggedIn")
    if userStatus {
      showHealthyFood()
    } else {
      showLogin()
    }
  }

  /// Creates a new UserLoginCoordinator and places it into the navigation controller
  private func showLogin() {
    let userLoginCoordinator = UserLoginCoordinator()
    userLoginCoordinator.delegate = self
    userLoginCoordinator.start()
    addChildCoordinator(userLoginCoordinator)
    rootViewController.present(userLoginCoordinator.rootViewController, animated: true)
  }

  /// Creates a new HealthyFoodViewController and places it into the navigation controller
  private func showHealthyFood() {
    let foodListCoordinator = FoodListCoordinator()
    addChildCoordinator(foodListCoordinator)
    foodListCoordinator.start()
    rootViewController.present(foodListCoordinator.rootViewController, animated: true)
  }
}

// MARK: - UserLoginCoordinatorDelegate

extension AppCoordinator: UserLoginCoordinatorDelegate {
  func didLoginSucceeded(_ coordinator: UserLoginCoordinator) {
    coordinator.rootViewController.dismiss(animated: true)
    removeChildCoordinator(coordinator)
    showHealthyFood()
  }
}
