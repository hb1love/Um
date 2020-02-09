//
//  BaseViewController.swift
//  Common
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import RxSwift

open class BaseViewController: UIViewController {

  public var disposeBag = DisposeBag()

  public var safeAreaInset: UIEdgeInsets = .zero {
    didSet {
      setupConstraints()
    }
  }

  open override func viewDidLoad() {
    setupSubviews()
    self.navigationController?.delegate = self

    super.viewDidLoad()
  }

  public override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    safeAreaInset = view.safeAreaInsets
  }

  open func setupSubviews() {}
  open func setupConstraints() {}
}

extension BaseViewController: UINavigationControllerDelegate {
  public func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
    return navigationController.topViewController?.supportedInterfaceOrientations ?? .all
  }
}
