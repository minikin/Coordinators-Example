//
//  AppCoordinator.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 20.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class AppCoordinator: HealthyFoodViewControllerDelegate {

  let navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let healthFoodVC = HealthyFoodViewController.makeFromStoryboard()
    healthFoodVC.delegate = self
    navigationController.pushViewController(healthFoodVC, animated: true)
  }

  func didSelect(_ food: HealthyFood) {
    let vitaminsVC = VitaminsViewController.makeFromStoryboard()
    vitaminsVC.vitamins = food.vitamins
    navigationController.pushViewController(vitaminsVC, animated: true)
  }
}
