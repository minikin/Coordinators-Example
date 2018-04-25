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
    productVC.delegate = self
    productVC.vitamins =  food.vitamins
    productVC.productName = food.name
    self.navigationController.pushViewController(productVC, animated: true)
  }

  private func presentVitaminDetails(_ vitamin: Vitamin) {
    let vitaminVC = VitaminDetailsViewController.makeFromStoryboard()
    vitaminVC.delegate = self
    vitaminVC.vitamin = vitamin
    self.navigationController.modalPresentationStyle = .overFullScreen
    navigationController.present(vitaminVC, animated: true)
  }
}

// MARK: - VitaminDetailsViewControllerDelegate

extension FoodListCoordinator: FoodListViewControllerDelegate {
  func didSelect(_ food: HealthyFood) {
    showProduct(food)
  }
}

// MARK: - ProductNutritionViewControllerDelegate

extension FoodListCoordinator: ProductNutritionViewControllerDelegate {
  func didSelect(_ vitamin: Vitamin) {
    presentVitaminDetails(vitamin)
  }
}

// MARK: - VitaminDetailsViewControllerDelegate

extension FoodListCoordinator: VitaminDetailsViewControllerDelegate {
  func dissmissVitaminDetails(_ vitaminDetailsVC: VitaminDetailsViewController) {
    vitaminDetailsVC.dismiss(animated: true)
  }
}

