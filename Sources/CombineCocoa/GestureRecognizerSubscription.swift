//
//  GestureRecognizerSubscription.swift
//  CombineCocoa
//
//  Created by tokijh on 20/09/2019.
//

import Combine
import UIKit

final class GestureRecognizerSubscription<SubscriberType: Subscriber, Recognizer: UIGestureRecognizer>: Subscription where SubscriberType.Input == Recognizer {
  let selector: Selector = #selector(Self.eventHandler)

  private var subscriber: SubscriberType?
  private weak var recognizer: Recognizer?

  init(subscriber: SubscriberType, recognizer: Recognizer) {
    self.subscriber = subscriber
    self.recognizer = recognizer
    recognizer.addTarget(self, action: self.selector)
  }

  func request(_ demand: Subscribers.Demand) {

  }

  func cancel() {
    self.recognizer?.removeTarget(self, action: self.selector)
    self.subscriber = nil
  }

  @objc func eventHandler() {
    if let recognizer = self.recognizer {
      _ = self.subscriber?.receive(recognizer)
    }
  }
}
