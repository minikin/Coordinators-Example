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

  weak var navigationController: UINavigationController?
  weak var tabBarController: UITabBarController?

  lazy var loginVC: LoginViewController = { [unowned self] in
    let loginVC = LoginViewController.makeFromStoryboard()
    loginVC.delegate = self
    return loginVC
  }()

  lazy var healthyFoodVC: HealthyFoodViewController = { [unowned self] in
    let foodVC = HealthyFoodViewController.makeFromStoryboard()
    foodVC.delegate = self
    return foodVC
  }()

  lazy var vitaminsVC: VitaminsViewController = { [unowned self] in
    let vitaminsVC = VitaminsViewController.makeFromStoryboard()
    vitaminsVC.delegate = self
    return vitaminsVC
  }()

  lazy var vitaminDetails: VitaminDetailsViewController = { [unowned self] in
    let vitaminDetails = VitaminDetailsViewController.makeFromStoryboard()
    vitaminDetails.delegate = self
    return vitaminDetails
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
      showHealthyFood()
    } else {
      showLogin()
    }
  }

  private func showLogin() {
    navigationController?.setViewControllers([loginVC], animated: true)
    //navigationController?.pushViewController(loginVC, animated: true)
  }

  private func hideLogin() {
    navigationController?.viewControllers.removeLast()
  }

  private func showHealthyFood() {
    navigationController?.setViewControllers([healthyFoodVC], animated: true)
    //navigationController?.pushViewController(healthyFoodVC, animated: true)
  }

  private func showVitaminDetails() {
    navigationController?.modalPresentationStyle = .overFullScreen
    navigationController?.present(vitaminDetails, animated: true)
  }

  private func hideVitaminDetails() {
    vitaminDetails.dismiss(animated: true)
  }
}

// MARK: - HealthyFoodViewControllerDelegate

extension AppCoordinator: HealthyFoodViewControllerDelegate {
  func didSelect(_ food: HealthyFood) {
    vitaminsVC.vitamins = food.vitamins
    navigationController?.setViewControllers([vitaminsVC], animated: true)
    //navigationController?.pushViewController(vitaminsVC, animated: true)
  }
}

// MARK: - LoginViewControllerDelegate

extension AppCoordinator: LoginViewControllerDelegate {
  func userLoggedIn() {
    hideLogin()
    showHealthyFood()
  }
}

// MARK: - VitaminsViewControllerDelegate

extension AppCoordinator: VitaminsViewControllerDelegate {
  func didSelect(_ vitamin: Vitamin) {
    vitaminDetails.vitamin = vitamin
    showVitaminDetails()
  }
}

// MARK: - VitaminDetailsViewControllerDelegate

extension AppCoordinator: VitaminDetailsViewControllerDelegate {
  func dissmissVitaminDetails() {
    hideVitaminDetails()
  }
}
