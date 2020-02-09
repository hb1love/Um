//
//  XibView.swift
//  Common
//
//  Created by hb1love on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

@IBDesignable
open class XibView: UIView {

  var contentView: UIView?
  @IBInspectable var nibName:String?

  public override func awakeFromNib() {
    super.awakeFromNib()
    xibSetup()
  }

  public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    xibSetup()
    contentView?.prepareForInterfaceBuilder()
  }

  func xibSetup() {
    guard let view = loadViewFromNib() else { return }
    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(view)
    contentView = view
  }

  func loadViewFromNib() -> UIView? {
    guard let nibName = nibName else { return nil }
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    return nib.instantiate(
      withOwner: self,
      options: nil
    ).first as? UIView
  }
}
