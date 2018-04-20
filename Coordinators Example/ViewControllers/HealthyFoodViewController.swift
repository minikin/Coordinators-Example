//
//  MainViewController.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 18.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import ItemsDataSource
import UIKit

protocol HealthyFoodViewControllerDelegate: class {
  func didSelect(_ food: HealthyFood)
}

final class HealthyFoodViewController: UIViewController {

  static func makeFromStoryboard() -> HealthyFoodViewController {
    let storyboard = UIStoryboard(name: "HealthyFood", bundle: nil)
    return storyboard.withId(String(describing: self))
  }

  // MARK: - Injections

  public var healthyDataSourse = ItemsDataSource(sections: [HealthyGroup](),
                                                 supplementaryDescriptor: { $0.supplementaryDescriptor! },
                                                 cellDescriptor: { $0.itemCellDescriptor })

  // MARK: - IBOutlets

  @IBOutlet var mainCollectionView: UICollectionView! {
    didSet {
      setMainCollectionViewDataSource()
      mainCollectionView.delegate = self
      setMainCollectionViewLayout()
      mainCollectionView.reloadData()
    }
  }

  // MARK: - Instance Properties

  weak var delegate: HealthyFoodViewControllerDelegate?

  // MARK: - ViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Helpers

  func setMainCollectionViewDataSource() {
    healthyDataSourse.sections = healthyFood
    mainCollectionView.dataSource = healthyDataSourse
  }

  func setMainCollectionViewLayout() {
    let layout = CommonFlowLayout(columns: 1,
                                  itemHeight: 60,
                                  inset: 0,
                                  spacing: 0,
                                  lineSpacing: 10,
                                  withHeader: true)
    mainCollectionView.collectionViewLayout = layout
  }
}

// MARK: - UICollectionViewDelegate

extension HealthyFoodViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let healthyCell = collectionView.cellForItem(at: indexPath) as! HealthyFoodCell
    guard let food = healthyCell.healthyModel else {
      return
    }
    delegate?.didSelect(food)
  }
}
