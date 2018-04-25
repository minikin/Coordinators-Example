//
//  RootViewControllerProvider.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 24.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//
import UIKit

protocol RootViewControllerProvider: class {
  // The coordinators 'rootViewController'. It helps to think of this as the view
  // controller that can be used to dismiss the coordinator from the view hierarchy.
  var rootViewController: UIViewController { get }
}

/// A Coordinator type that provides a root UIViewController
typealias RootCoordinator = Coordinator & RootViewControllerProvider
