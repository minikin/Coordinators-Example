//
//  FoodListCoordinator.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 24.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

protocol FoodListCoordinatorDelegate: class {
  // 
}

final class FoodListCoordinator: RootCoordinator {

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
    let healthyFoodVC = FoodListViewController.makeFromStoryboard()
    navigationController.isNavigationBarHidden = false
    navigationController.viewControllers = [healthyFoodVC]
  }

}

// MARK: - VitaminDetailsViewControllerDelegate

extension FoodListCoordinator: ProductNutritionViewControllerDelegate {
  func didSelect(_ vitamin: Vitamin) {

  }
}
