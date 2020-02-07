//
//  UIViewController+Rx.swift
//  Common
//
//  Created by hb1love on 2020/02/06.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

public extension Reactive where Base: UIViewController {
  var viewDidLoad: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidLoad))
      .map { _ in }
    return ControlEvent(events: source)
  }

  var viewWillAppear: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewWillAppear))
      .map { _ in }
    return ControlEvent(events: source)
  }

  var viewDidAppear: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidAppear))
      .map { _ in }
    return ControlEvent(events: source)
  }

  var viewWillDisappear: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewWillDisappear))
      .map { _ in }
    return ControlEvent(events: source)
  }

  var viewDidDisappear: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidDisappear))
      .map { _ in }
    return ControlEvent(events: source)
  }
}
