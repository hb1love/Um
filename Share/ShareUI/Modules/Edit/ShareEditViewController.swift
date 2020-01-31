//
//  ShareEditViewController.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit

public final class ShareEditViewController: BaseViewController, View {

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }

  public func bind(reactor: ShareEditViewReactor) {

  }
}
