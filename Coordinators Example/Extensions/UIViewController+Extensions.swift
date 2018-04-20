//
//  UIViewController+.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 20.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

extension UIViewController {
  func embed(childViewController: UIViewController, into containerView: UIView) {
    childViewController.willMove(toParentViewController: self)
    addChildViewController(childViewController)
    containerView.embed(subview: childViewController.view, aligningTo: containerView)
    childViewController.didMove(toParentViewController: self)
  }
}
