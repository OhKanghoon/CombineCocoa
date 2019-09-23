//
//  UIButton+Combine.swift
//  CombineCocoaTests
//
//  Created by ohkanghoon on 19/09/2019.
//

import Combine
import UIKit

extension CombineCompatible where Self: UIButton {
  public var tapPublisher: AnyPublisher<Void, Never> {
    return self.controlPublisher(for: .touchUpInside)
  }
}
