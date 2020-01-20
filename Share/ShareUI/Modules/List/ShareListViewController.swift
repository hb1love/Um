//
//  ShareListViewController.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit

public final class ShareListViewController: BaseViewController, View {
  
  public override func viewDidLoad() {
    super.viewDidLoad()

    let a = UIView()
    a.backgroundColor = .blue
    a.frame = view.frame
    view.addSubview(a)
  }

  public func bind(reactor: ShareListViewReactor) {

  }
}
