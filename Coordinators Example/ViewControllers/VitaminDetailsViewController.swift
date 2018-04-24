//
//  ModalViewController.swift
//  Coordinators Example
//
//  Created by Sasha Prokhorenko on 19.04.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

protocol VitaminDetailsViewControllerDelegate: class {
  func dissmissVitaminDetails()
}

final class VitaminDetailsViewController: UIViewController {

  // MARK: - Class methods

  static func makeFromStoryboard() -> VitaminDetailsViewController {
    let storyboard = UIStoryboard(name: "VitaminDetails", bundle: nil)
    return storyboard.withId(String(describing: self))
  }

  // MARK: - IBOutlets

  @IBOutlet private weak var vitaminLabel: UILabel!
  @IBOutlet private weak var vitamiAmountLabel: UILabel!

  // MARK: - Instance Properties

  var vitamin: Vitamin?
  weak var delegate: VitaminDetailsViewControllerDelegate?

  // MARK: - ViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do nothing
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setLabels()
  }

  // MARK: - Helpers

  private func setLabels() {
    vitaminLabel.text = vitamin?.name ?? "Unknow"
    let amount = vitamin?.amount ?? 0
    vitamiAmountLabel.text = String(format: "%.5f", amount)
  }

  // MARK: - Actions

  @IBAction private func closeDidPress(_ sender: UIButton) {
    delegate?.dissmissVitaminDetails()
  }
}
