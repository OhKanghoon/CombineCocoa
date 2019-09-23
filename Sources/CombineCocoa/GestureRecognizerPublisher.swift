//
//  GestureRecognizerPublisher.swift
//  CombineCocoa
//
//  Created by tokijh on 20/09/2019.
//

import Combine
import UIKit

public struct GestureRecognizerPublisher<Recognizer: UIGestureRecognizer>: Publisher {
  public typealias Output = Recognizer
  public typealias Failure = Never

  private let recognizer: Recognizer

  public init(recognizer: Recognizer) {
    self.recognizer = recognizer
  }

  public func receive<S>(subscriber: S) where S : Subscriber, S.Failure == GestureRecognizerPublisher.Failure, S.Input == GestureRecognizerPublisher.Output {
    let subscription = GestureRecognizerSubscription(subscriber: subscriber, recognizer: recognizer)
    subscriber.receive(subscription: subscription)
  }
}
