//
//  FoodListCoordinator.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 24.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

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
    healthyFoodVC.delegate = self
    self.navigationController.isNavigationBarHidden = false
    self.navigationController.viewControllers = [healthyFoodVC]
  }

  private func showProduct(_ food: HealthyFood) {
    let productVC = ProductNutritionViewController.makeFromStoryboard()
    productVC.vitamins =  food.vitamins
    productVC.productName = food.name
    self.navigationController.pushViewController(productVC, animated: true)
  }

}

// MARK: - VitaminDetailsViewControllerDelegate

extension FoodListCoordinator: FoodListViewControllerDelegate {
  func didSelect(_ food: HealthyFood) {
    showProduct(food)
  }
}
