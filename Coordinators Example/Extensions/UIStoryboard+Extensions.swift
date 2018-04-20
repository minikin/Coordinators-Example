//
//  UIStoryboard+.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 20.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

extension UIStoryboard {
  func initial<T: UIViewController>() -> T {
    guard let viewController = instantiateInitialViewController() as? T else {
      fatalError("Could not instantiate \(T.self) in \(self)")
    }
    return viewController
  }

  func initialNavigationController<T: UINavigationController>() -> T {
    return initial() as T
  }

  func withId<T: UIViewController>(_ id: String) -> T {
    guard let viewController = instantiateViewController(withIdentifier: id) as? T else {
      fatalError("Could not instantiate \(T.self) in \(self) for \(id)")
    }
    return viewController
  }
}
