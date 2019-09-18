//
//  ControlPublisher.swift
//  CombineCocoa
//
//  Created by ohkanghoon on 18/09/2019.
//

import Combine
import UIKit

public struct ControlPublisher<Control: UIControl>: Publisher {
  public typealias Output = Control
  public typealias Failure = Never

  private let control: Control
  private let controlEvents: Control.Event

  public init(control: Control, events: Control.Event) {
    self.control = control
    self.controlEvents = events
  }

  public func receive<S>(subscriber: S) where S : Subscriber, S.Failure == ControlPublisher.Failure, S.Input == ControlPublisher.Output {
    let subscription = ControlSubscription(subscriber: subscriber, control: control, controlEvents: controlEvents)
    subscriber.receive(subscription: subscription)
  }
}
