//
//  Coordinator.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 24.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

protocol Coordinator: class {
  /// The array containing any child Coordinators
  var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {
  /// ChildCoordinators is an optional 
  var childCoordinators: [Coordinator] {
    get {
      return []
    } set {
      // We need to provide an empty one. Nothing to set here.
    }
  }
  /// Add a child coordinator to the parent
  public func addChildCoordinator(_ childCoordinator: Coordinator) {
    childCoordinators.append(childCoordinator)
  }
  
  /// Remove a child coordinator from the parent
  public func removeChildCoordinator(_ childCoordinator: Coordinator) {
    childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
  }
}
