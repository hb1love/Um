//
//  LaunchViewController.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit
import SnapKit
import RxSwift
import RxCocoa

public final class LaunchViewController: BaseViewController, StoryboardView {

  // MARK: - Subviews

  @IBOutlet weak var logoView: UIImageView!

  // MARK: - Flow handler

  var onFinish: ((_ isAuthorized: Bool) -> Void)?

  public override func setupSubviews() {

  }

  public override func setupConstraints() {

  }

  public func bind(reactor: LaunchViewReactor) {
    rx.viewWillAppear
      .map { true }
      .bind(to: navigationController!.navigationBar.rx.isHidden)
      .disposed(by: disposeBag)

    rx.viewDidAppear.map { Reactor.Action.checkLaunchingInfo }
      .delay(1.5, scheduler: MainScheduler.instance)
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    reactor.state.map { $0.endLaunching }
      .filter { $0 }
      .distinctUntilChanged()
      .subscribe(onNext: { [weak self] _ in
        let isAuthorized = reactor.currentState.isAuthorized
        self?.onFinish?(isAuthorized)
      }).disposed(by: disposeBag)
  }
}
