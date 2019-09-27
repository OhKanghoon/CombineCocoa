//
//  ViewController.swift
//  CombineCocoaExample
//
//  Created by ohkanghoon on 19/09/2019.
//  Copyright © 2019 kanghoon. All rights reserved.
//

import Combine
import UIKit

import CombineCocoa

class ViewController: UIViewController {

  // MARK: Properties

  private let numSubject = CurrentValueSubject<Int, Never>(0)
  private var cancellables: Set<AnyCancellable> = .init()


  // MARK: UI

  @IBOutlet var numLabel: UILabel!
  @IBOutlet var plusButton: UIButton!
  @IBOutlet var minusButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    self.numSubject
      .map { String($0) }
      .assign(to: \.text, on: self.numLabel)
      .store(in: &cancellables)

    self.plusButton.tapPublisher()
      .map { [weak self] _ in (self?.numSubject.value ?? 0) + 1 }
      .subscribe(numSubject)
      .store(in: &cancellables)

    self.minusButton.tapPublisher()
      .map { [weak self] _ in (self?.numSubject.value ?? 0) - 1 }
      .subscribe(numSubject)
      .store(in: &cancellables)
  }
}

