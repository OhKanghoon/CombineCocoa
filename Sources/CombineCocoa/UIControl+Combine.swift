//
//  UIControl+Combine.swift
//  CombineCocoa
//
//  Created by ohkanghoon on 18/09/2019.
//

import Combine
import UIKit

extension UIControl: CombineCompatible { }

extension CombineCompatible where Self: UIControl {
  public func controlPublisher(for events: UIControl.Event) -> AnyPublisher<Void, Never> {
    return ControlPublisher(control: self, events: events)
      .map { _ in return }
      .subscribe(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
}
