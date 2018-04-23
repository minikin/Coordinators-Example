//
//  TheSecondViewController.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 19.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
  func userLoggedIn()
}

final class LoginViewController: UIViewController {

  // MARK: - Class methods

  static func makeFromStoryboard() -> LoginViewController {
    let storyboard = UIStoryboard(name: "Login", bundle: nil)
    return storyboard.withId(String(describing: self))
  }

  // MARK: - IBOutlets

  @IBOutlet var infoLabel: UILabel!
  @IBOutlet private var pressMeButton: UIButton!
  @IBOutlet private var activityIndicator: UIActivityIndicatorView!

  // MARK: - Insatance Properies

  let defaults = UserDefaults.standard
  weak var delegate: LoginViewControllerDelegate?

  // MARK: - ViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Actions

  @IBAction private func pressMeDidPress(_ sender: UIButton) {
    logInUser { [weak self] in
      self?.activityIndicator.stopAnimating()
      self?.infoLabel.text = "You're logged in!\n You will be redirected to Fruits in a few seconds..."
      self?.pressMeButton.isHidden = true
      self?.redirectToFruits()
    }
  }

  private func logInUser(complition: @escaping () -> Void) {
    activityIndicator.isHidden = false
    activityIndicator.startAnimating()
    infoLabel.text = "Connecting to server..."
    delayWithSeconds(3.0) {
      self.defaults.set(true, forKey: "UserLoggedIn")
      complition()
    }
  }

  // MARK: - Helpers

  private func redirectToFruits() {
    delayWithSeconds(3.0) {
      self.delegate?.userLoggedIn()
      print("redirectToFruits ")
    }
  }

  private func delayWithSeconds(_ seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      completion()
    }
  }
}
