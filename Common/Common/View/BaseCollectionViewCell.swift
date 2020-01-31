//
//  BaseCollectionViewCell.swift
//  Common
//
//  Created by hb1love on 2020/01/30.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import RxSwift

open class BaseCollectionViewCell: UICollectionViewCell {
  public var disposeBag = DisposeBag()

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
