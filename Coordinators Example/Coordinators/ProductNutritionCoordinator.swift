//
//  ProductNutritionCoordinator.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 25.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit


final class ProductNutritionCoordinator: RootCoordinator {

  // MARK: - Properties

  private lazy var navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    return navigationController
  }()

  var childCoordinators: [Coordinator] = []

  var rootViewController: UIViewController {
    return self.navigationController
  }

  func start() {
    let productNutrition = ProductNutritionViewController.makeFromStoryboard()
    navigationController.isNavigationBarHidden = false
    navigationController.viewControllers = [productNutrition]
  }
}
