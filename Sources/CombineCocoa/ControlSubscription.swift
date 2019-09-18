//
//  ControlSubscription.swift
//  CombineCocoa
//
//  Created by ohkanghoon on 18/09/2019.
//

import Combine
import UIKit

final class ControlSubscription<SubscriberType: Subscriber, Control: UIControl>: Subscription where SubscriberType.Input == Control {
  let selector: Selector = #selector(ControlSubscription.eventHandler)

  private var subscriber: SubscriberType?
  private weak var control: Control?
  private let controlEvents: Control.Event

  init(subscriber: SubscriberType, control: Control, controlEvents: Control.Event) {
    self.subscriber = subscriber
    self.control = control
    self.controlEvents = controlEvents
    control.addTarget(self, action: #selector(self.eventHandler), for: controlEvents)
  }

  func request(_ demand: Subscribers.Demand) {

  }

  func cancel() {
    self.control?.removeTarget(self, action: self.selector, for: self.controlEvents)
    self.subscriber = nil
  }

  @objc func eventHandler() {
    if let control = self.control {
      _ = self.subscriber?.receive(control)
    }
  }
}
