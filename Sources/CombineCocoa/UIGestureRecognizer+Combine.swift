//
//  UIGestureRecognizer+Combine.swift
//  CombineCocoa
//
//  Created by tokijh on 20/09/2019.
//

import Combine
import UIKit

extension UIGestureRecognizer: CombineCompatible { }

extension CombineCompatible where Self: UIGestureRecognizer {
  public var eventPublisher: AnyPublisher<Self, Never> {
    return GestureRecognizerPublisher(recognizer: self)
      .subscribe(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
}
