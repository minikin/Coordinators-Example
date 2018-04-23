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
    let loginVC = LoginViewController.makeFromStoryboard()
    loginVC.delegate = self
    return loginVC
  }()

  lazy var healthyFoodVC: HealthyFoodViewController = { [weak self] in
    let foodVC = HealthyFoodViewController.makeFromStoryboard()
    foodVC.delegate = self
    return foodVC
  }()

  lazy var vitaminsVC: VitaminsViewController = { [weak self] in
    let vitaminsVC = VitaminsViewController.makeFromStoryboard()
    vitaminsVC.delegate = self
    return vitaminsVC
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
    navigationController.pushViewController(loginVC, animated: true)
  }

  private func hideLogin() {
    navigationController.viewControllers.removeLast()
  }

  private func showFruits() {
    navigationController.pushViewController(healthyFoodVC, animated: true)
  }

  private func vitamins() {

  }
}

// MARK: - HealthyFoodViewControllerDelegate

extension AppCoordinator: HealthyFoodViewControllerDelegate {
  func didSelect(_ food: HealthyFood) {
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

// MARK: - VitaminsViewControllerDelegate

extension AppCoordinator: VitaminsViewControllerDelegate {
  func didSelect(_ vitamin: Vitamin) {
    print("vitamin:", vitamin)
  }
}
