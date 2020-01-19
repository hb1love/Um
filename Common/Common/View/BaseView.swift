//
//  BaseView.swift
//  Common
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import RxSwift

open class BaseView: UIView {
  public var disposeBag = DisposeBag()

  public convenience init() {
    self.init(frame: .zero)
  }

  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubviews()
    setupConstraints()
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupSubviews()
    setupConstraints()
  }

  open func setupSubviews() {}
  open func setupConstraints() {}
}
