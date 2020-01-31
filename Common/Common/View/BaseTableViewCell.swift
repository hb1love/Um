//
//  BaseTableViewCell.swift
//  Common
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import RxSwift

open class BaseTableViewCell: UITableViewCell {
  public var disposeBag = DisposeBag()

  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
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
