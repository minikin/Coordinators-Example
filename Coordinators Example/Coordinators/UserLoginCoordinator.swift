//
//  UserLoginCoordinator.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 24.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

protocol UserLoginCoordinatorDelegate: class {
  func didLoginSucceeded(_ coordinator: UserLoginCoordinator)
}

final class UserLoginCoordinator: RootCoordinator {

   // MARK: - Instance Properties

  weak var delegate: UserLoginCoordinatorDelegate?

  private lazy var navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    return navigationController
  }()

  var childCoordinators: [Coordinator] = []

  var rootViewController: UIViewController {
    return self.navigationController
  }

  // MARK: - Helpers

  func start() {
    let loginVC = LoginViewController.makeFromStoryboard()
    loginVC.delegate = self
    navigationController.viewControllers = [loginVC]
  }

}

// MARK: - LoginViewControllerDelegate

extension UserLoginCoordinator: LoginViewControllerDelegate {
  func userLoggedIn() {
    delegate?.didLoginSucceeded(self)
  }
}
