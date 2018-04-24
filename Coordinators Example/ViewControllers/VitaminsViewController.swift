//
//  ExampleViewController.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 18.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import ItemsDataSource
import UIKit

protocol VitaminsViewControllerDelegate: class {
  func didSelect(_ vitamin: Vitamin)
}

final class VitaminsViewController: UIViewController {

  // MARK: - Static methods

  static func makeFromStoryboard() -> VitaminsViewController {
    let storyboard = UIStoryboard(name: "Vitamins", bundle: nil)
    return storyboard.withId(String(describing: self))
  }

  // MARK: - Injections

  public var vitaminsDataSourse = ItemsDataSource(items: [Vitamin](),
                                                  cellDescriptor: { $0.itemCellDescriptor })

  // MARK: - IBOutlets

  @IBOutlet weak var exampleCollectionView: UICollectionView! {
    didSet {
      setExampleCollectionViewDataSource()
      exampleCollectionView.delegate = self
      setExampleCollectionViewLayout()
      exampleCollectionView.reloadData()
    }
  }

  // MARK: - Instance Properties

  var vitamins = [Vitamin]()
  weak var delegate: VitaminsViewControllerDelegate?

  // MARK: - ViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do nothing for now
  }

  // MARK: - Helpers

  private func setExampleCollectionViewDataSource() {
    vitaminsDataSourse.items = vitamins
    exampleCollectionView.dataSource = vitaminsDataSourse
  }

  private func setExampleCollectionViewLayout() {
    let layout = CommonFlowLayout(columns: 2,
                                  itemHeight: 200,
                                  inset: 5,
                                  spacing: 0,
                                  lineSpacing: 5)
    exampleCollectionView.collectionViewLayout = layout
  }
}

// MARK: - UICollectionViewDelegate

extension VitaminsViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let vitaminCell = collectionView.cellForItem(at: indexPath) as! ViataminCell
    guard let vitamin = vitaminCell.vitamim else {
      return
    }
    delegate?.didSelect(vitamin)
  }
}
