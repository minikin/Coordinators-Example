//
//  AppCoordinator.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 20.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class AppCoordinator {

  // MARK: - Instance properties

  var navigationController: UINavigationController
  let tabBarController: UITabBarController?

  lazy var loginVC: LoginViewController = { [weak self] in
    LoginViewController.makeFromStoryboard()
  }()

  lazy var healthyFoodVC: HealthyFoodViewController = { [weak self] in
    let foodVC = HealthyFoodViewController.makeFromStoryboard()
    foodVC.delegate = self
    return foodVC
  }()

  // MARK: - Initialisation

  init(navigationController: UINavigationController, tabBarController: UITabBarController? = nil) {
    self.navigationController = navigationController
    self.tabBarController = tabBarController
  }

  // MARK: - Helpers

  func checkUserStatus() {
    let defaults = UserDefaults.standard
    let userStatus = defaults.bool(forKey: "UserLoggedIn")
    if userStatus {
      showFruits()
    } else {
      showLogin()
    }
  }

  private func showLogin() {
    loginVC.delegate = self
    navigationController.pushViewController(loginVC, animated: true)
  }

  private func hideLogin() {
    navigationController.viewControllers.removeLast()
  }

  private func showFruits() {
    navigationController.pushViewController(healthyFoodVC, animated: true)
  }
}

// MARK: - HealthyFoodViewControllerDelegate

extension AppCoordinator: HealthyFoodViewControllerDelegate {
  func didSelect(_ food: HealthyFood) {
    let vitaminsVC = VitaminsViewController.makeFromStoryboard()
    vitaminsVC.vitamins = food.vitamins
    navigationController.pushViewController(vitaminsVC, animated: true)
  }
}

// MARK: - LoginViewControllerDelegate

extension AppCoordinator: LoginViewControllerDelegate {
  func userLoggedIn() {
    hideLogin()
    showFruits()
  }
}
